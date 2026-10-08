import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';
import 'package:invoiceninja_flutter/ui/marketing/marketing_screen.dart';
import 'package:invoiceninja_flutter/ui/marketing/marketing_widgets.dart';
import 'package:redux/redux.dart';

const activityFields = [
  {'name': 'opportunity_id', 'type': 'select', 'options': 'opportunities'},
  {'name': 'title', 'type': 'text'},
  {
    'name': 'kind',
    'type': 'select',
    'options': ['email', 'call', 'task']
  },
  {'name': 'due_at', 'type': 'datetime-local'},
  {'name': 'template_id', 'type': 'select', 'options': 'templates'},
  {'name': 'notes', 'type': 'textarea'},
];

Map<String, dynamic> bootstrap() => {
      'labels': {
        'opportunities': 'Opportunities',
        'activities': 'Activities',
        'add_followup': 'Add follow-up',
        'new': 'New',
        'edit': 'Edit',
        'cancel': 'Cancel',
        'save': 'Save',
        'from_quote': 'From a quote',
        'search': 'Search',
        'stage_id': 'Stage',
        'all': 'All',
        'board': 'Board',
        'list': 'List',
        'archived': 'Archived',
        'due_work': 'Due now',
        'needs_followup': 'No next action',
        'history': 'History',
        'empty': 'No records',
        'title': 'Title',
        'kind': 'Type',
        'opportunity_id': 'Opportunity',
        'client_id': 'Client',
        'contact_id': 'Contact',
        'quote_id': 'Quote',
        'template_id': 'Email template',
        'consent': 'Consent',
        'consent_source': 'Consent source',
        'enroll': 'Start sequence',
        'sequence': 'Sequence',
        'selected': 'Selected',
      },
      'options': {
        'clients': [
          {'id': 'a', 'name': 'Acme'},
          {'id': 'b', 'name': 'Bravo'},
        ],
        'contacts': [
          {'id': 'ca', 'name': 'Alice', 'client_id': 'a'},
          {'id': 'cb', 'name': 'Bob', 'client_id': 'b'},
        ],
        'quotes': [],
        'currencies': [
          {'id': '1', 'name': 'CHF'}
        ],
        'opportunities': [
          {'id': 'one', 'name': 'Offer one'},
          {'id': 'two', 'name': 'Offer two'},
        ],
      },
      'config': {
        'automatic': false,
        'stages': [
          {'id': 'open', 'name': 'Open', 'outcome': 'open'},
          {'id': 'won', 'name': 'Won', 'outcome': 'won'},
          {'id': 'lost', 'name': 'Lost', 'outcome': 'lost'},
        ],
        'templates': [
          {'id': 'mail', 'name': 'Offer follow-up'}
        ],
        'offer_sequence_en': 'offer',
        'sequences': [
          {
            'id': 'offer',
            'name': 'Offer sequence',
            'steps': [
              {'title': 'Ask about offer', 'kind': 'email', 'days': 3},
              {'title': 'Call customer', 'kind': 'call', 'days': 7},
            ]
          },
        ],
      },
      'permissions': {'create': true, 'edit': true, 'configure': false},
      'workload': {'due': 0, 'needs_followup': 2},
      'fields': {'opportunities': [], 'activities': activityFields},
      'defaults': {},
      'forecast': [],
    };

Map<String, dynamic> opportunity(String id, {String stage = 'open'}) => {
      'id': id,
      'title': 'Offer $id',
      'client_id': 'a',
      'contact_id': 'ca',
      'quote_id': '',
      'amount': 1000,
      'currency_id': '1',
      'stage_id': stage,
      'revision': 1,
      'archived': false,
      'next_activity': null,
      'automatic': false,
      'locale': 'en',
    };

Future<void> settleRequests(WidgetTester tester) async {
  // WebClient decodes with compute(), outside the widget clock.
  for (var i = 0; i < 15; i++) {
    await tester
        .runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await tester.pump(const Duration(milliseconds: 50));
    if (find.byType(LinearProgressIndicator).evaluate().isEmpty) {
      break;
    }
  }
  await tester.pumpAndSettle();
}

Future<void> workspace(WidgetTester tester, List<http.Request> requests,
    {List<dynamic>? rows, Size size = const Size(1400, 1000)}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  var state = AppState(
      prefState: PrefState(), reportErrors: false, isWhiteLabeled: false);
  final company = state.userCompanyState
      .rebuild((b) => b.userCompany.company.enabledModules = kModuleMarketing);
  state = state.rebuild((b) => b.userCompanyStates[0] = company);
  final client = MockClient((request) async {
    requests.add(request);
    final path = request.url.path;
    final result = path.endsWith('/bootstrap')
        ? {'data': bootstrap()}
        : path.endsWith('/opportunities')
            ? {
                'data': rows ?? [opportunity('one'), opportunity('two')],
                'last_page': 1,
              }
            : {'data': [], 'last_page': 1};
    return http.Response(jsonEncode(result), 200, headers: {
      'content-type': 'application/json',
      'x-app-version': kMinServerVersion,
      'x-minimum-client-version': '5.0.0'
    });
  });
  await tester.pumpWidget(StoreProvider<AppState>(
    store: Store<AppState>((state, action) => state, initialState: state),
    child: MaterialApp(
        home: MarketingScreen(
      webClient: WebClient(clientFactory: () => client),
    )),
  ));
  await settleRequests(tester);
}

void main() {
  testWidgets('prices display and accept at most two decimal places',
      (tester) async {
    var values = <String, dynamic>{'amount': 1234.5678};
    final form = GlobalKey<FormState>();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: StatefulBuilder(
      builder: (context, setState) => Column(children: [
        Text(marketingAmount(context, 1234.5678)),
        Form(
            key: form,
            child: MarketingFields(
              fields: const [
                {'name': 'amount', 'type': 'number'}
              ],
              values: values,
              bootstrap: bootstrap(),
              config: {},
              requiredFields: const {'amount'},
              onChanged: (v) => setState(() => values = v),
            )),
      ]),
    ))));
    expect(find.text('1,234.57'), findsOneWidget);
    expect(find.text('1234.57'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), '12.34');
    expect(values['amount'], 12.34);
    await tester.enterText(find.byType(TextFormField), '12.345');
    expect(values['amount'], 12.34);
    await tester.enterText(find.byType(TextFormField), '12,34');
    expect(values['amount'], 12.34);
    expect(form.currentState!.validate(), true);
    expect(marketingPriceInput(1.0000), '1');
  });

  testWidgets('date and time pickers round-trip local input to UTC',
      (tester) async {
    var values = <String, dynamic>{'due_at': '2026-10-05T12:00'};
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: StatefulBuilder(
      builder: (context, setState) => MarketingFields(
        fields: const [
          {'name': 'due_at', 'type': 'datetime-local'}
        ],
        values: values,
        bootstrap: bootstrap(),
        config: {},
        onChanged: (v) => setState(() => values = v),
      ),
    ))));
    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();
    final local = DateTime.utc(2026, 10, 5, 12).toLocal();
    expect(
        tester
            .widget<DatePickerDialog>(find.byType(DatePickerDialog))
            .initialDate,
        DateTime(local.year, local.month, local.day));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<TimePickerDialog>(find.byType(TimePickerDialog))
            .initialTime,
        TimeOfDay.fromDateTime(local));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(values['due_at'], '2026-10-05T12:00');
  });

  testWidgets('required fields prevent an incomplete activity from saving',
      (tester) async {
    final form = GlobalKey<FormState>();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Form(
      key: form,
      child: SingleChildScrollView(
          child: MarketingEditorForm(
        resource: 'activities',
        fields: activityFields,
        values: const {'kind': 'email'},
        bootstrap: bootstrap(),
        onChanged: (_) {},
      )),
    ))));
    expect(form.currentState!.validate(), false);
    await tester.pumpAndSettle();
    expect(find.text('Required'), findsNWidgets(4));
  });

  test('naive API dates and explicit offsets represent the same UTC instant',
      () {
    expect(
        marketingUtcDate('2026-10-05 12:00:00'), DateTime.utc(2026, 10, 5, 12));
    expect(marketingUtcDate('2026-10-05T14:00:00+02:00'),
        DateTime.utc(2026, 10, 5, 12));
    expect(marketingUtcDate('invalid'), isNull);
    expect(marketingUtcDate(null), isNull);
  });

  test('switching away from email clears the hidden template', () {
    expect(
        marketingUpdate(
            {'kind': 'email', 'template_id': 'mail'}, 'kind', 'call'),
        {'kind': 'call', 'template_id': ''});
  });

  testWidgets('large pickers search and retain a selected option',
      (tester) async {
    var value = '';
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: StatefulBuilder(
      builder: (context, setState) => MarketingOptionField(
        key: ValueKey(value),
        label: 'Customer',
        value: value,
        options: List.generate(150, (i) => {'id': '$i', 'name': 'Customer $i'}),
        onChanged: (next) => setState(() => value = next),
      ),
    ))));
    await tester.tap(find.byType(MarketingOptionField));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Customer 149');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Customer 149').last);
    await tester.pumpAndSettle();
    expect(value, '149');
    expect(find.text('Customer 149'), findsOneWidget);
  });

  testWidgets('activity editor shows a template only for email',
      (tester) async {
    var values = <String, dynamic>{
      'opportunity_id': 'one',
      'title': 'Call',
      'kind': 'call',
      'due_at': '2026-10-05T12:00',
      'template_id': ''
    };
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      child: StatefulBuilder(
          builder: (context, setState) => MarketingEditorForm(
                resource: 'activities',
                fields: activityFields,
                values: values,
                bootstrap: bootstrap(),
                onChanged: (v) => setState(() => values = v),
              )),
    ))));
    expect(find.text('Email template *'), findsNothing);
    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('email').last);
    await tester.pumpAndSettle();
    expect(find.text('Email template *'), findsOneWidget);
    expect(find.text('Shown in your local time zone'), findsOneWidget);
  });

  testWidgets('changing client resets the visible contact and consent evidence',
      (tester) async {
    var values = <String, dynamic>{
      'title': 'Offer',
      'client_id': 'a',
      'contact_id': 'ca',
      'consent': true,
      'consent_source': 'Old evidence'
    };
    final data = bootstrap();
    final fields = [
      {'name': 'client_id', 'type': 'select', 'options': 'clients'},
      {'name': 'contact_id', 'type': 'select', 'options': 'contacts'},
      {'name': 'consent', 'type': 'boolean'},
      {'name': 'consent_source', 'type': 'text'},
    ];
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      child: StatefulBuilder(
          builder: (context, setState) => MarketingEditorForm(
                resource: 'opportunities',
                fields: fields,
                values: values,
                bootstrap: data,
                onChanged: (v) => setState(() => values = v),
              )),
    ))));
    expect(find.text('Alice'), findsOneWidget);
    await tester.tap(find.byType(MarketingOptionField).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Bravo'));
    await tester.pumpAndSettle();
    expect(values['contact_id'], '');
    expect(values['consent'], false);
    expect(values['consent_source'], '');
    expect(find.text('Alice'), findsNothing);
    expect(find.text('Old evidence'), findsNothing);
  });

  testWidgets('quick follow-up saves an activity and keeps pipeline context',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests);
    await tester.tap(find.text('Add follow-up').first);
    await tester.pumpAndSettle();
    expect(find.text('New · Activities'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await settleRequests(tester);
    final saved = requests.singleWhere((r) => r.method == 'POST');
    expect(saved.url.path, endsWith('/activities'));
    expect(jsonDecode(saved.body)['opportunity_id'], 'one');
    expect(jsonDecode(saved.body)['kind'], 'call');
    expect(find.text('Offer two'), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);
    expect(
        requests.where(
            (r) => r.method == 'GET' && r.url.path.endsWith('/activities')),
        isEmpty);
  });

  testWidgets('history clears pipeline search before fetching activities',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests);
    await tester.enterText(find.byType(TextField).first, 'Offer one');
    await tester.pump(const Duration(milliseconds: 350));
    await settleRequests(tester);
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('History'));
    await settleRequests(tester);
    final request =
        requests.lastWhere((r) => r.url.path.endsWith('/activities'));
    expect(request.url.queryParameters['q'], '');
    expect(request.url.queryParameters['opportunity_id'], 'one');
    expect(
        requests
            .where((r) => r.url.path.endsWith('/activities'))
            .map((r) => r.url.queryParameters['state'])
            .toSet(),
        {'sent', 'failed', 'sending', 'done', 'cancelled'});
  });

  testWidgets('activity views keep planned work separate from history',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests, size: const Size(390, 844));
    await tester.ensureVisible(find.text('Activities'));
    await tester.tap(find.text('Activities'));
    await settleRequests(tester);
    expect(tester.takeException(), isNull);
    expect(requests.last.url.queryParameters['state'], 'pending');

    requests.clear();
    await tester.tap(find.text('Activity log'));
    await settleRequests(tester);
    expect(tester.takeException(), isNull);
    expect(
        requests
            .where((r) => r.url.path.endsWith('/activities'))
            .map((r) => r.url.queryParameters['state'])
            .toSet(),
        {'sent', 'failed', 'sending', 'done', 'cancelled'});

    await tester.tap(find.text('Future activities'));
    await settleRequests(tester);
    expect(requests.last.url.queryParameters['state'], 'pending');
  });

  testWidgets('editing the next deadline saves an activity from the pipeline',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests, rows: [
      {
        ...opportunity('one'),
        'expected_close': '2026-12-31',
        'next_activity': {
          'id': 'next',
          'opportunity_id': 'one',
          'title': 'Call Acme',
          'kind': 'call',
          'state': 'pending',
          'due_at': '2026-12-01T10:00:00Z',
        },
      }
    ]);
    expect(find.textContaining('2026-12-31'), findsOneWidget);
    await tester.tap(find.text('Call Acme'));
    await tester.pumpAndSettle();
    expect(find.text('Edit · Activities'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await settleRequests(tester);
    final saved = requests.singleWhere((r) => r.method == 'PUT');
    expect(saved.url.path, endsWith('/activities/next'));
    expect(find.text('Offer one'), findsOneWidget);
  });

  testWidgets('cancel protects edits and lets the user keep working',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests);
    await tester.tap(find.text('Add follow-up').first);
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byType(TextFormField).first, 'Discuss revised offer');
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Discard unsaved changes?'), findsOneWidget);
    await tester.tap(find.text('Keep editing'));
    await tester.pumpAndSettle();
    expect(find.text('Discuss revised offer'), findsOneWidget);
    expect(requests.where((r) => r.method == 'POST'), isEmpty);
  });

  testWidgets('changing filters clears bulk selection', (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests);
    await tester.tap(find.text('List'));
    await settleRequests(tester);
    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();
    expect(find.text('Selected: 1'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'Offer two');
    await tester.pump(const Duration(milliseconds: 350));
    await settleRequests(tester);
    expect(find.text('Selected: 1'), findsNothing);
    expect(tester.widget<Checkbox>(find.byType(Checkbox).first).value, false);
  });

  testWidgets('closing a stage requires confirmation before any mutation',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests);
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Change stage'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Won').last);
    await tester.pumpAndSettle();
    expect(
        find.text('Closing this opportunity cancels its pending follow-ups.'),
        findsOneWidget);
    expect(requests.where((r) => r.method == 'PUT'), isEmpty);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(requests.where((r) => r.method == 'PUT'), isEmpty);
  });

  testWidgets('sequence dialog previews timing and manual delivery',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests);
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start sequence'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(DropdownButtonFormField<String>).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Offer sequence').last);
    await tester.pumpAndSettle();
    expect(find.text('Ask about offer'), findsOneWidget);
    expect(find.text('Call customer'), findsOneWidget);
    expect(find.textContaining('manual sending'), findsOneWidget);
    expect(requests.where((r) => r.method == 'POST'), isEmpty);
  });

  testWidgets(
      'closed opportunities offer history without follow-up or enrollment',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests, rows: [opportunity('one', stage: 'won')]);
    // The header still permits creating an unrelated follow-up.
    expect(find.text('Add follow-up'), findsNothing);
    expect(find.text('No next action'), findsNothing);
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    expect(find.text('Start sequence'), findsNothing);
    expect(find.text('History'), findsOneWidget);
  });

  testWidgets('workspace and searchable quote action fit a narrow viewport',
      (tester) async {
    final requests = <http.Request>[];
    await workspace(tester, requests, size: const Size(390, 844));
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('From a quote'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.tap(find.byType(MarketingOptionField).last);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
