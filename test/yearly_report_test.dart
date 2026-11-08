import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';
import 'package:invoiceninja_flutter/ui/reports/reports_screen.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';

void main() {
  late List<Uri> requests;

  setUp(() {
    requests = [];
  });

  http.Client createClient() => MockClient((request) async {
        requests.add(request.url);
        final year = request.url.queryParameters['year'];
        return http.Response(
          jsonEncode({
            'data': {
              'currencies': [
                {
                  'currency_id': '1',
                  'currency_name': 'Report $year',
                  'currency_code': 'USD',
                  'payments': [],
                  'expenses': [],
                },
              ],
            },
          }),
          200,
          headers: {
            'x-app-version': '5.11.66',
            'x-minimum-client-version': '5.0.0',
          },
        );
      });

  Future<void> settleReport(WidgetTester tester) async {
    // WebClient decodes JSON in an isolate, which needs real async time.
    await tester.runAsync(() async {
      final timeout = Stopwatch()..start();
      do {
        await tester.pump();
        if (find.byType(CircularProgressIndicator).evaluate().isEmpty) {
          return;
        }
        await Future<void>.delayed(const Duration(milliseconds: 10));
      } while (timeout.elapsed < const Duration(seconds: 10));
    });
    expect(find.byType(CircularProgressIndicator), findsNothing);
    await tester.pumpAndSettle();
  }

  Future<void> pumpReport(WidgetTester tester) async {
    final state = AppState(
      prefState: PrefState(),
      reportErrors: false,
      isWhiteLabeled: false,
      url: 'https://example.com/api/v1',
    );
    await tester.pumpWidget(
      StoreProvider<AppState>(
        store: Store<AppState>((state, action) => state, initialState: state),
        child: MaterialApp(
          localizationsDelegates: const [AppLocalizationsDelegate()],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: SingleChildScrollView(child: YearlyReportView(state: state)),
          ),
        ),
      ),
    );
    await settleReport(tester);
  }

  testWidgets('loads other years as they are entered without validation errors',
      (tester) async {
    await http.runWithClient(() async {
      await pumpReport(tester);
      final currentYear = DateTime.now().year;
      expect(requests.single.queryParameters['year'], '$currentYear');

      for (final year in [currentYear - 1, currentYear + 1, currentYear]) {
        await tester.enterText(find.byType(TextFormField), '$year');
        await settleReport(tester);

        expect(
          tester
              .state<FormFieldState<String>>(find.byType(TextFormField))
              .hasError,
          isFalse,
        );
        expect(requests.last.queryParameters['year'], '$year');
        expect(find.text('Report $year (USD)'), findsOneWidget);
      }

      final requestCount = requests.length;
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await settleReport(tester);
      expect(requests, hasLength(requestCount));

      await tester.tap(find.byType(SwitchListTile));
      await settleReport(tester);
      expect(requests.last.queryParameters['year'], '$currentYear');
      expect(requests.last.queryParameters['convert_to_main_currency'], '1');
    }, createClient);
  });

  testWidgets('rejects invalid years and recovers when a valid year is entered',
      (tester) async {
    await http.runWithClient(() async {
      await pumpReport(tester);
      for (final value in ['', '202', '1899', '10000', 'abcd']) {
        await tester.enterText(find.byType(TextFormField), value);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await settleReport(tester);

        expect(
          tester
              .state<FormFieldState<String>>(find.byType(TextFormField))
              .hasError,
          isTrue,
        );
        expect(requests, hasLength(1));
      }

      for (final year in [1900, 9999]) {
        await tester.enterText(find.byType(TextFormField), '$year');
        await settleReport(tester);
        expect(
          tester
              .state<FormFieldState<String>>(find.byType(TextFormField))
              .hasError,
          isFalse,
        );
        expect(requests.last.queryParameters['year'], '$year');
        expect(find.text('Report $year (USD)'), findsOneWidget);
      }
    }, createClient);
  });
}
