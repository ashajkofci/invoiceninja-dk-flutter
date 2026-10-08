import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/bulk_line_items.dart';
import 'invoice_group_line_item_test.dart' show item;

InvoiceItemEntity group(String id) =>
    item(id, typeId: InvoiceItemEntity.TYPE_GROUP, groupId: id);

void main() {
  test('validates bulk numbers and supports comma decimals without silently clearing rebates', () {
    expect(parseBulkLineItemValue('2,5', useComma: true), 2.5);
    expect(parseBulkLineItemValue('2.5', useComma: false), 2.5);
    expect(parseBulkLineItemValue('0', useComma: false), 0);
    for (final input in ['', 'abc', '-1', 'NaN', 'Infinity', '1.2.3']) {
      expect(parseBulkLineItemValue(input, useComma: false), null);
    }
  });
  test(
      'deletes selected rows without removing group headers or unselected children',
      () {
    final items = [
      group('a'),
      item('one', groupId: 'a'),
      item('two', groupId: 'a'),
      item('three')
    ];
    expect(bulkLineItems(items, {0, 1, 3}, BulkLineItemAction.delete),
        [items[0], items[2]]);
    expect(items.length, 4);
  });
  test(
      'changes coefficient name and value together while preserving other rows',
      () {
    final items = [item('one'), item('two')];
    final result = bulkLineItems(items, {1}, BulkLineItemAction.coefficient,
        value: 2.5, name: 'Weekend');
    expect(result[0], same(items[0]));
    expect(result[1].timeCoefficient, 2.5);
    expect(result[1].timeCoefficientName, 'Weekend');
    expect(result[1].productKey, 'two');
    expect(items[1].timeCoefficient, 1);
  });
  test('sets a rebate to zero and leaves unrelated rows unchanged', () {
    final items = [item('one').rebuild((b) => b..discount = 10), item('two')];
    final result =
        bulkLineItems(items, {0}, BulkLineItemAction.discount, value: 0);
    expect(result[0].discount, 0);
    expect(result[1], same(items[1]));
    expect(items[0].discount, 10);
  });
  test('moves nonadjacent rows from different groups in document order', () {
    final items = [
      item('before'),
      group('a'),
      item('existing', groupId: 'a'),
      group('b'),
      item('after', groupId: 'b'),
      item('unselected')
    ];
    final result =
        bulkLineItems(items, {4, 0}, BulkLineItemAction.group, groupId: 'a');
    expect(result.map((item) => item.productKey),
        ['a', 'existing', 'before', 'after', 'b', 'unselected']);
    expect(result.sublist(1, 4).every((item) => item.groupId == 'a'), true);
    expect(items[0].groupId, '');
  });
  test('ungroups selected rows without splitting remaining groups', () {
    final items = [
      group('a'),
      item('one', groupId: 'a'),
      item('two', groupId: 'a')
    ];
    final result = bulkLineItems(items, {1}, BulkLineItemAction.group);
    expect(result.map((item) => item.productKey), ['a', 'two', 'one']);
    expect(result.last.groupId, '');
  });
  test('rejects unknown groups and invalid numeric values', () {
    final items = [item('one')];
    expect(
        bulkLineItems(items, {0}, BulkLineItemAction.group, groupId: 'missing'),
        same(items));
    for (final value in [-1.0, double.infinity, double.nan]) {
      expect(
          bulkLineItems(items, {0}, BulkLineItemAction.discount, value: value),
          same(items));
    }
  });
}
