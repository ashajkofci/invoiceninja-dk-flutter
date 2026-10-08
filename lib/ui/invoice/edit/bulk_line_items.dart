import 'package:invoiceninja_flutter/data/models/models.dart';

enum BulkLineItemAction { delete, coefficient, discount, group, move }

List<InvoiceItemEntity> bulkLineItems(
  List<InvoiceItemEntity> items,
  Set<int> indices,
  BulkLineItemAction action, {
  double value = 0,
  String name = '',
  String groupId = '',
}) {
  bool selected(int index) => indices.contains(index) && !items[index].isGroup;
  if (action == BulkLineItemAction.move) {
    // value is an insertion gap in the original list, as supplied by onReorder.
    if (!value.isFinite ||
        value != value.truncateToDouble() ||
        value < 0 ||
        value > items.length) {
      return items;
    }
    final moved = [
      for (var i = 0; i < items.length; i++)
        if (selected(i)) items[i]
    ];
    if (moved.isEmpty) return items;
    final remaining = [
      for (var i = 0; i < items.length; i++)
        if (!selected(i)) items[i]
    ];
    final insertAt = [
      for (var i = 0; i < value.toInt(); i++)
        if (!selected(i)) i
    ].length;
    remaining.insertAll(insertAt, moved);
    return remaining;
  }
  if (action == BulkLineItemAction.delete) {
    return [
      for (var i = 0; i < items.length; i++)
        if (!selected(i)) items[i]
    ];
  }
  if (action == BulkLineItemAction.group) {
    if (groupId.isNotEmpty &&
        !items.any((item) => item.isGroup && item.groupId == groupId)) {
      return items;
    }
    final moved = [
      for (var i = 0; i < items.length; i++)
        if (selected(i) && !items[i].isTask)
          items[i].rebuild((b) => b..groupId = groupId)
    ];
    if (moved.isEmpty) {
      return items;
    }
    final remaining = [
      for (var i = 0; i < items.length; i++)
        if (!selected(i) || items[i].isTask) items[i]
    ];
    final last = groupId.isEmpty
        ? remaining.length - 1
        : remaining.lastIndexWhere((item) => item.groupId == groupId);
    remaining.insertAll(last + 1, moved);
    return remaining;
  }
  if (!value.isFinite || value < 0) {
    return items;
  }
  return [
    for (var i = 0; i < items.length; i++)
      if (!selected(i) ||
          (action == BulkLineItemAction.coefficient && items[i].isTask))
        items[i]
      else
        items[i].rebuild((b) {
          if (action == BulkLineItemAction.discount) {
            b.discount = value;
          } else {
            b.timeCoefficient = value;
            b.timeCoefficientName = name;
          }
        })
  ];
}

double? parseBulkLineItemValue(String input, {required bool useComma}) {
  final normalized =
      useComma ? input.replaceAll('.', '').replaceAll(',', '.') : input;
  final value = double.tryParse(normalized.trim());
  return value != null && value.isFinite && value >= 0 ? value : null;
}
