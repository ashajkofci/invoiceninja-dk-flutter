import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:invoiceninja_flutter/data/models/invoice_model.dart';
import 'package:invoiceninja_flutter/main_app.dart';
import 'package:invoiceninja_flutter/redux/app/app_reducer.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';

void main() {
  testWidgets('pro rata distribution of group override price', (tester) async {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(
        prefState: null,
        reportErrors: false,
        isWhiteLabeled: false,
      ),
    );

    await tester.pumpWidget(StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: const SizedBox(),
      ),
    ));
    await tester.pump();

    final header = InvoiceItemEntity().rebuild((b) => b
      ..typeId = InvoiceItemEntity.TYPE_GROUP
      ..groupId = 'g1'
      ..groupTitle = 'Group'
      ..groupHasPrice = true
      ..groupPrice = 100
      ..quantity = 1);

    // Child A: 2 units x 30 = 60 (66.67%)
    final childA = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g1'
      ..productKey = 'A'
      ..quantity = 2
      ..cost = 30);

    // Child B: 1 unit x 30 with 50% rebate => original 30 -> 15 (33.33%)
    final childB = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g1'
      ..productKey = 'B'
      ..quantity = 1
      ..cost = 30
      ..discount = 50);

    final invoice = InvoiceEntity().rebuild((b) => b
      ..lineItems.addAll([header, childA, childB]));

    final shareA = childA.groupChildProRataAmount(invoice, 2);
    final shareB = childB.groupChildProRataAmount(invoice, 2);
    final unitA = childA.groupChildProRataUnitPrice(invoice, 2);
    final unitB = childB.groupChildProRataUnitPrice(invoice, 2);

    expect(shareA, closeTo(66.67, 0.01));
    expect(shareB, closeTo(33.33, 0.01));
    expect(unitA, closeTo(33.34, 0.01));
    expect(unitB, closeTo(33.33, 0.01));
    expect(shareA! + shareB!, closeTo(100, 0.01));

    // Non-override group => null
    final plainHeader = header.rebuild((b) => b..groupHasPrice = false);
    final plainInvoice =
        InvoiceEntity().rebuild((b) => b..lineItems.addAll([plainHeader, childA]));
    expect(childA.groupChildProRataAmount(plainInvoice, 2), isNull);

    // Non-group child (no header) => null
    final orphan = InvoiceItemEntity().rebuild((b) => b
      ..groupId = 'g2'
      ..quantity = 1
      ..cost = 10);
    expect(orphan.groupChildProRataAmount(invoice, 2), isNull);
  });
}
