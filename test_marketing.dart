import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/ui/marketing/marketing_screen.dart';

void main() {
  test('cached Kanban filtering includes opportunities beyond page one', () {
    final rows = List.generate(
      65,
      (i) => {
        'id': '$i',
        'title': 'Offer $i',
        'stage_id': 'open',
        'client_id': 'c',
        'archived': false,
        'next_activity': null,
      },
    );
    final bootstrap = <String, dynamic>{
      'options': {
        'clients': [
          {'id': 'c', 'name': 'Acme'},
        ],
        'quotes': [],
      },
      'config': {
        'stages': [
          {'id': 'open', 'outcome': 'open'},
        ],
      },
    };
    expect(
      marketingFilterOpportunities(rows, bootstrap, search: 'Acme').length,
      65,
    );
    expect(
      marketingFilterOpportunities(
        rows,
        bootstrap,
        search: 'Offer 64',
        worklist: 'needs_followup',
      ).single['id'],
      '64',
    );
  });
  test('changing client clears recipient consent and quote', () {
    final updated = marketingUpdate(
      {
        'client_id': 'a',
        'contact_id': 'c',
        'quote_id': 'q',
        'consent': true,
        'consent_source': 'old',
      },
      'client_id',
      'b',
    );
    expect(updated, {
      'client_id': 'b',
      'contact_id': '',
      'quote_id': '',
      'consent': false,
      'consent_source': '',
    });
  });
  testWidgets('native settings form edits toggles and sequence steps', (
    tester,
  ) async {
    Map<String, dynamic> values = {'automatic': false, 'steps': <dynamic>[]};
    final fields = [
      {'name': 'automatic', 'type': 'boolean'},
      {
        'name': 'steps',
        'type': 'list',
        'fields': [
          {'name': 'title', 'type': 'text'},
        ],
      },
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => SingleChildScrollView(
              child: MarketingFields(
                fields: fields,
                values: values,
                bootstrap: {'labels': {}, 'options': {}},
                config: {},
                onChanged: (v) => setState(() => values = v),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(values['automatic'], true);
    await tester.tap(find.text('steps (0)'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('add'));
    await tester.pumpAndSettle();
    expect((values['steps'] as List).length, 1);
  });
}
