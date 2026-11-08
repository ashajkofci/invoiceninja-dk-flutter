import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/product/product_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_desktop.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_vm.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_vm.dart';
import 'package:invoiceninja_flutter/ui/product/edit/product_rental_history.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:redux/redux.dart';

import 'invoice_group_line_item_test.dart' show item;

Future<Store<AppState>> editor(WidgetTester tester, List<dynamic> actions,
    {bool dirty = false, String productKey = 'Camera'}) async {
  tester.view.physicalSize = const Size(1600, 1200);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  var state = AppState(
    prefState: PrefState().rebuild((b) => b..appLayout = AppLayout.desktop),
    reportErrors: false,
    isWhiteLabeled: false,
    currentRoute: InvoiceEditScreen.route,
    url: 'https://example.test/api/v1',
  );
  final product =
      ProductEntity(id: 'camera-id').rebuild((b) => b..productKey = 'Camera');
  final invoice = InvoiceEntity(id: 'invoice-id').rebuild((b) => b
    ..isChanged = dirty
    ..lineItems.add(item(productKey)));
  final companyState = state.userCompanyState.rebuild((b) => b
    ..userCompany.isAdmin = true
    ..userCompany.company.enabledModules =
        kModuleInvoices | kModuleProductReservations
    ..userCompany.company.settings.translations.replace({})
    ..productState.map[product.id] = product
    ..productState.list.add(product.id));
  state = state.rebuild((b) => b
    ..userCompanyStates[0] = companyState
    ..uiState.invoiceUIState.editing.replace(invoice));
  final store = Store<AppState>((state, action) {
    actions.add(action);
    return state;
  }, initialState: state);
  await tester.pumpWidget(StoreProvider<AppState>(
    store: store,
    child: MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: const [AppLocalizationsDelegate()],
      supportedLocales: const [Locale('en')],
      home: Scaffold(
        body: SingleChildScrollView(
          child: InvoiceEditItemsDesktop(
            isTasks: false,
            entityViewModel: InvoiceEditVM(
                state: state, company: state.company, invoice: invoice),
            viewModel: InvoiceEditItemsVM(
              state: state,
              company: state.company,
              invoice: invoice,
              onChangedInvoiceItem: (_, __) {},
            ),
          ),
        ),
      ),
    ),
  ));
  await tester.pumpAndSettle();
  await tester.tap(find.byIcon(Icons.more_vert).first);
  await tester.pumpAndSettle();
  return store;
}

void main() {
  testWidgets('Edit Product opens the saved product for the selected line',
      (tester) async {
    final actions = <dynamic>[];
    await editor(tester, actions);
    await tester.tap(find.text('Edit Product'));
    await tester.pumpAndSettle();
    expect(actions.whereType<EditProduct>().single.product.id, 'camera-id');
  });

  testWidgets('Edit Product keeps the existing unsaved invoice guard',
      (tester) async {
    final actions = <dynamic>[];
    final store = await editor(tester, actions, dirty: true);
    final draft = store.state.invoiceUIState.editing;
    await tester.tap(find.text('Edit Product'));
    await tester.pumpAndSettle();
    expect(actions.whereType<EditProduct>(), isEmpty);
    expect(actions.whereType<DiscardChanges>(), isEmpty);
    final continueEditing =
        find.textContaining(RegExp('continue editing', caseSensitive: false));
    expect(continueEditing, findsOneWidget);
    await tester.tap(continueEditing);
    await tester.pumpAndSettle();
    expect(store.state.invoiceUIState.editing, same(draft));
  });

  testWidgets(
      'Stats loads the selected product and preserves the invoice draft',
      (tester) async {
    final requests = <http.Request>[];
    await http.runWithClient(() async {
      final actions = <dynamic>[];
      final store = await editor(tester, actions, dirty: true);
      final draft = store.state.invoiceUIState.editing;
      await tester.tap(find.text('Stats'));
      await tester.pump();
      for (var i = 0; i < 50; i++) {
        await tester.runAsync(
            () => Future<void>.delayed(const Duration(milliseconds: 20)));
        await tester.pump(const Duration(milliseconds: 50));
        if (find.text('Total rentals').evaluate().isNotEmpty) {
          break;
        }
      }
      expect(find.byType(ProductRentalHistory), findsOneWidget);
      expect(find.text('Stats · Camera'), findsOneWidget);
      expect(find.text('Total rentals'), findsOneWidget,
          reason: tester
              .widgetList<Text>(find.byType(Text))
              .map((text) => text.data)
              .join(' | '));
      expect(requests.single.url.queryParameters['product_id'], 'camera-id');
      await tester.tap(find.textContaining('INV-OTHER'));
      await tester.pumpAndSettle();
      final continueEditing =
          find.textContaining(RegExp('continue editing', caseSensitive: false));
      expect(continueEditing, findsOneWidget);
      expect(actions.whereType<DiscardChanges>(), isEmpty);
      await tester.tap(continueEditing);
      await tester.pumpAndSettle();
      expect(find.byType(ProductRentalHistory), findsOneWidget);
      await tester.tap(find.byType(CloseButton));
      await tester.pumpAndSettle();
      expect(find.byType(ProductRentalHistory), findsNothing);
      expect(actions.whereType<DiscardChanges>(), isEmpty);
      expect(store.state.invoiceUIState.editing, same(draft));
    },
        () => MockClient((request) async {
              requests.add(request);
              return http.Response(
                  jsonEncode({
                    'data': {
                      'statistics': {
                        'total_rentals': 3,
                        'total_days': 12,
                        'average_days': 4,
                        'total_quantity': 6,
                        'by_year': [],
                        'totals_by_currency': [],
                      },
                      'history': [
                        {
                          'invoice_id': 'other-invoice-id',
                          'invoice_number': 'INV-OTHER',
                          'client_name': 'Acme',
                          'start_date': '2026-10-01',
                          'end_date': '2026-10-04',
                          'days': 3,
                          'quantity': 1,
                          'unit_price': 10,
                          'total_price': 30,
                          'currency_id': '1',
                        }
                      ],
                    },
                  }),
                  200,
                  headers: {
                    'content-type': 'application/json',
                    'x-app-version': kMinServerVersion,
                    'x-minimum-client-version': '5.0.0',
                  });
            }));
  });

  testWidgets('custom invoice lines have no saved product links',
      (tester) async {
    await editor(tester, [], productKey: 'Custom service');
    expect(find.text('Edit Product'), findsNothing);
    expect(find.text('Stats'), findsNothing);
  });
}
