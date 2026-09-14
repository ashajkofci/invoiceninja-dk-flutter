import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';

InvoiceItemEntity item(
  String productKey, {
  String typeId = InvoiceItemEntity.TYPE_STANDARD,
  String groupId = '',
}) =>
    (InvoiceItemEntityBuilder()
          ..productKey = productKey
          ..notes = ''
          ..cost = 0
          ..quantity = 1
          ..taxName1 = ''
          ..taxRate1 = 0
          ..taxName2 = ''
          ..taxRate2 = 0
          ..taxName3 = ''
          ..taxRate3 = 0
          ..typeId = typeId
          ..customValue1 = ''
          ..customValue2 = ''
          ..customValue3 = ''
          ..customValue4 = ''
          ..discount = 0
          ..groupId = groupId)
        .build();

void main() {
  test('moves and removes a group with all of its children', () {
    final before = item('before');
    final group = item(
      'group',
      typeId: InvoiceItemEntity.TYPE_GROUP,
      groupId: 'group-a',
    );
    final child = item('child', groupId: 'group-a');
    final after = item('after');
    final invoice = InvoiceEntity().rebuild(
      (b) => b..lineItems.addAll([before, group, child, after]),
    );

    final moved = invoice.moveLineItem(1, 2);
    expect(moved.lineItems.map((item) => item.productKey), [
      'before',
      'after',
      'group',
      'child',
    ]);
    expect(moved.removeLineItem(2).lineItems.map((item) => item.productKey), [
      'before',
      'after',
    ]);
  });
}
