import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/bulk_line_items.dart';
import 'package:invoiceninja_flutter/ui/invoice/edit/invoice_edit_items_vm.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:invoiceninja_flutter/utils/completers.dart';
import 'package:invoiceninja_flutter/utils/dialogs.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

class LineItemBulkActions extends StatelessWidget {
  const LineItemBulkActions(
      {super.key,
      required this.viewModel,
      required this.selected,
      required this.onClear});
  final EntityEditItemsVM viewModel;
  final Set<int> selected;
  final VoidCallback onClear;

  void _apply(BulkLineItemAction action,
      {double value = 0, String name = '', String groupId = ''}) {
    Debouncer.complete();
    viewModel.onBulkLineItems!(
        Set<int>.from(selected), action, value, name, groupId);
    onClear();
  }

  Future<void> _numberDialog(
      BuildContext context, BulkLineItemAction action) async {
    final localization = AppLocalization.of(context)!;
    final isCoefficient = action == BulkLineItemAction.coefficient;
    final presets =
        decodeTimeCoefficients(viewModel.company!.timeCoefficientsJson);
    var input = isCoefficient ? '1' : '';
    var name = '';
    final label = isCoefficient
        ? reservationText(context, 'timeCoefficient')
        : '${localization.discount} ${viewModel.invoice!.isAmountDiscount ? localization.amount : '%'}';
    final result = await showDialog<(double, String)>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(builder: (context, setState) {
        final value = parseBulkLineItemValue(input, useComma: viewModel.company!.useCommaAsDecimalPlace);
        final valid = input.trim().isNotEmpty &&
            value != null &&
            value.isFinite &&
            value >= 0;
        return AlertDialog(
          title: Text('$label (${selected.length})'),
          content: isCoefficient && presets.isNotEmpty
              ? DropdownButton<String>(
                  isExpanded: true,
                  value: name,
                  items: [
                    DropdownMenuItem(
                        value: '',
                        child: Text(reservationText(context, 'standard'))),
                    for (final preset in presets)
                      DropdownMenuItem(
                          value: preset['name'].toString(),
                          child: Text(preset['name'].toString()))
                  ],
                  onChanged: (value) => setState(() => name = value ?? ''),
                )
              : TextFormField(
                  initialValue: input,
                  autofocus: true,
                  decoration: InputDecoration(labelText: label),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) => setState(() => input = value)),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(localization.cancel)),
            TextButton(
                onPressed: !valid
                    ? null
                    : () => Navigator.pop(dialogContext, (
                          isCoefficient && presets.isNotEmpty
                              ? resolveTimeCoefficient(name, presets, 1)
                              : value,
                          name
                        )),
                child: Text(localization.apply)),
          ],
        );
      }),
    );
    if (context.mounted && result != null) {
      _apply(action, value: result.$1, name: result.$2);
    }
  }

  Future<void> _groupDialog(BuildContext context) async {
    final localization = AppLocalization.of(context)!;
    final groups = viewModel.invoice!.lineItems.where((item) => item.isGroup);
    final groupId = await showDialog<String>(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text('${localization.select} ${localization.group}'),
              children: [
                SimpleDialogOption(
                    onPressed: () => Navigator.pop(context, ''),
                    child: Text(localization.none)),
                for (final group in groups)
                  SimpleDialogOption(
                      onPressed: () => Navigator.pop(context, group.groupId),
                      child: Text([group.groupTitle, group.notes.trim()]
                          .where((value) => value.isNotEmpty)
                          .join('\n'))),
              ],
            ));
    if (context.mounted && groupId != null) {
      _apply(BulkLineItemAction.group, groupId: groupId);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selected.isEmpty || viewModel.onBulkLineItems == null) {
      return const SizedBox.shrink();
    }
    final localization = AppLocalization.of(context)!;
    final invoice = viewModel.invoice!;
    final hasProducts = selected.every(
        (i) => i < invoice.lineItems.length && !invoice.lineItems[i].isTask);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('${selected.length} ${localization.selected}'),
            TextButton.icon(
                icon: const Icon(Icons.delete_outline),
                label: Text(localization.delete),
                onPressed: () => confirmCallback(
                    context: context,
                    callback: (_) => _apply(BulkLineItemAction.delete))),
            if (hasProducts && viewModel.company!.enableTimeCoefficient)
              TextButton(
                  onPressed: () =>
                      _numberDialog(context, BulkLineItemAction.coefficient),
                  child: Text(reservationText(context, 'timeCoefficient'))),
            if (viewModel.company!.enableProductDiscount)
              TextButton(
                  onPressed: () =>
                      _numberDialog(context, BulkLineItemAction.discount),
                  child: Text(localization.discount)),
            if (hasProducts &&
                viewModel.onGroupInvoiceItem != null &&
                invoice.lineItems.any((item) => item.isGroup))
              TextButton.icon(
                  icon: const Icon(Icons.account_tree_outlined),
                  onPressed: () => _groupDialog(context),
                  label: Text(localization.group)),
            TextButton(onPressed: onClear, child: Text(localization.cancel)),
          ],
        ));
  }
}
