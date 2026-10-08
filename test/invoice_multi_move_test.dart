import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/bulk_line_items.dart';
import 'invoice_group_line_item_test.dart' show item;

void main() {
  test('moves nonadjacent selections down together in document order', () {
    final items = [item('one'), item('two'), item('three'), item('four')];
    final result =
        bulkLineItems(items, {2, 0}, BulkLineItemAction.move, value: 4);
    expect(
        result.map((item) => item.productKey), ['two', 'four', 'one', 'three']);
    expect(
        items.map((item) => item.productKey), ['one', 'two', 'three', 'four']);
    expect(result.last, same(items[2]));
  });

  test('moves selections up and accounts for removed rows before the drop', () {
    final items = [item('one'), item('two'), item('three'), item('four')];
    expect(
        bulkLineItems(items, {1, 3}, BulkLineItemAction.move, value: 0)
            .map((item) => item.productKey),
        ['two', 'four', 'one', 'three']);
    expect(
        bulkLineItems(items, {0, 2}, BulkLineItemAction.move, value: 2)
            .map((item) => item.productKey),
        ['two', 'one', 'three', 'four']);
  });

  test('keeps group membership and excludes headers and stale indices', () {
    final header =
        item('group', typeId: InvoiceItemEntity.TYPE_GROUP, groupId: 'a');
    final items = [header, item('child', groupId: 'a'), item('other')];
    final result = bulkLineItems(
        items, {-1, 0, 1, 2, 99}, BulkLineItemAction.move,
        value: 0);
    expect(result.map((item) => item.productKey), ['child', 'other', 'group']);
    expect(result.first.groupId, 'a');
    expect(result.last, same(header));
    for (final destination in [-1.0, 0.5, 4.0, double.nan, double.infinity]) {
      expect(
          bulkLineItems(items, {1, 2}, BulkLineItemAction.move,
              value: destination),
          same(items));
    }
  });
}
