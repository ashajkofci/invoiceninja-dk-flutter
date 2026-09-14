// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/constants.dart';
import 'package:collection/collection.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/entities.dart';
import 'package:invoiceninja_flutter/data/models/invoice_model.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/app/lists/list_divider.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:invoiceninja_flutter/utils/strings.dart';

class InvoiceItemListTile extends StatelessWidget {
  const InvoiceItemListTile({
    required this.invoice,
    required this.invoiceItem,
    required this.onTap,
  });

  final Function onTap;
  final InvoiceEntity invoice;
  final InvoiceItemEntity? invoiceItem;

  @override
  Widget build(BuildContext context) {
    final String? qty = formatNumber(invoiceItem!.quantity, context,
        clientId: invoice.isPurchaseOrder ? null : invoice.clientId,
        vendorId: invoice.isPurchaseOrder ? invoice.vendorId : null,
        formatNumberType: FormatNumberType.double);
    final localization = AppLocalization.of(context);

    final store = StoreProvider.of<AppState>(context);
    final state = store.state;
    final company = state.company;
    final client = state.clientState.get(invoice.clientId);
    final precision =
        state.staticState.currencyMap[client.currencyId]?.precision ?? 2;

    final groupHeader = invoice.lineItems.firstWhereOrNull(
        (item) => item.isGroup && item.groupId == invoiceItem!.groupId);
    final isGroupChild = !invoiceItem!.isGroup && groupHeader != null;
    final hideGroupChildPrices = isGroupChild &&
        (groupHeader.groupHasPrice || groupHeader.groupHideItemPrices);
    final proRataUnitPrice = isGroupChild && groupHeader.groupHasPrice
        ? invoiceItem!.groupChildProRataUnitPrice(invoice, precision)
        : null;
    final proRataAmount = isGroupChild && groupHeader.groupHasPrice
        ? invoiceItem!.groupChildProRataAmount(invoice, precision)
        : null;
    final displayCost = proRataUnitPrice ?? invoiceItem!.cost;
    final displayTotal =
        proRataAmount ?? invoiceItem!.total(invoice, precision);

    String subtitle =
        '$qty x ${formatNumber(displayCost, context, clientId: invoice.isPurchaseOrder ? null : invoice.clientId, vendorId: invoice.isPurchaseOrder ? invoice.vendorId : null, roundToPrecision: false) ?? ''}';

    if (invoiceItem!.isGroup) {
      subtitle = localization!.group;
    } else if (hideGroupChildPrices && proRataUnitPrice == null) {
      subtitle = invoiceItem!.notes;
    }

    if (company.enableTimeCoefficient) {
      subtitle +=
          ' • ${invoiceItem!.timeCoefficientName.isNotEmpty ? invoiceItem!.timeCoefficientName : reservationText(context, 'timeCoefficient')}: ${invoiceItem!.timeCoefficient}';
    }

    if (invoiceItem!.discount != 0) {
      subtitle += ' • ${localization!.discount} ';
      if (invoice.isAmountDiscount) {
        subtitle += formatNumber(
          invoiceItem!.discount,
          context,
          clientId: invoice.isPurchaseOrder ? null : invoice.clientId,
          vendorId: invoice.isPurchaseOrder ? invoice.vendorId : null,
        )!;
      } else {
        subtitle += formatNumber(invoiceItem!.discount, context,
            clientId: invoice.isPurchaseOrder ? null : invoice.clientId,
            vendorId: invoice.isPurchaseOrder ? invoice.vendorId : null,
            formatNumberType: FormatNumberType.percent)!;
      }
    }

    if (company.calculateTaxes) {
      subtitle += ' • ' +
          localization!.lookup(kTaxCategories[invoiceItem!.taxCategoryId]);
    }

    if (invoiceItem!.taxRate1 != 0) {
      final taxRate1 = formatNumber(invoiceItem!.taxRate1, context,
          formatNumberType: FormatNumberType.percent);
      subtitle += ' • $taxRate1 ${invoiceItem!.taxName1}';
    }

    if (invoiceItem!.taxRate2 != 0) {
      final taxRate2 = formatNumber(invoiceItem!.taxRate2, context,
          formatNumberType: FormatNumberType.percent);
      subtitle += ' • $taxRate2 ${invoiceItem!.taxName2}';
    }

    if (invoiceItem!.taxRate3 != 0) {
      final taxRate3 = formatNumber(invoiceItem!.taxRate3, context,
          formatNumberType: FormatNumberType.percent);
      subtitle += ' • $taxRate3 ${invoiceItem!.taxName3}';
    }

    final List<String?> parts = [];
    if (company.hasCustomField(CustomFieldType.product1) &&
        invoiceItem!.customValue1.isNotEmpty) {
      parts.add(formatCustomValue(
          context: context,
          field: CustomFieldType.product1,
          value: invoiceItem!.customValue1));
    }
    if (company.hasCustomField(CustomFieldType.product2) &&
        invoiceItem!.customValue2.isNotEmpty) {
      parts.add(formatCustomValue(
          context: context,
          field: CustomFieldType.product2,
          value: invoiceItem!.customValue2));
    }
    if (company.hasCustomField(CustomFieldType.product3) &&
        invoiceItem!.customValue3.isNotEmpty) {
      parts.add(formatCustomValue(
          context: context,
          field: CustomFieldType.product3,
          value: invoiceItem!.customValue3));
    }
    if (company.hasCustomField(CustomFieldType.product4) &&
        invoiceItem!.customValue4.isNotEmpty) {
      parts.add(formatCustomValue(
          context: context,
          field: CustomFieldType.product4,
          value: invoiceItem!.customValue4));
    }
    for (final field in [
      (CustomFieldType.product5, invoiceItem!.customValue5),
      (CustomFieldType.product6, invoiceItem!.customValue6),
      (CustomFieldType.product7, invoiceItem!.customValue7),
      (CustomFieldType.product8, invoiceItem!.customValue8),
    ]) {
      if (company.hasCustomField(field.$1) && field.$2.isNotEmpty) {
        parts.add(formatCustomValue(
          context: context,
          field: field.$1,
          value: field.$2,
        ));
      }
    }
    if (invoiceItem!.notes.isNotEmpty) {
      parts.add(removeAllHtmlTags(invoiceItem!.notes).trim());
    }
    if (parts.isNotEmpty) {
      subtitle += '\n' + parts.join(' • ');
    }

    return Material(
        color: Theme.of(context).cardColor,
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              onTap: onTap as void Function()?,
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${isGroupChild ? '  ↳ ' : ''}${invoiceItem!.isGroup ? invoiceItem!.groupTitle : invoiceItem!.productKey}',
                      style: invoiceItem!.isGroup
                          ? TextStyle(fontWeight: FontWeight.bold)
                          : null,
                    ),
                  ),
                  if (!hideGroupChildPrices || proRataAmount != null)
                    Text(formatNumber(
                      displayTotal,
                      context,
                      clientId:
                          invoice.isPurchaseOrder ? null : invoice.clientId,
                      vendorId:
                          invoice.isPurchaseOrder ? invoice.vendorId : null,
                    )!),
                ],
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Prevent scrollbars on web
                  SizedBox(width: 1),
                ],
              ),
              trailing: Icon(Icons.navigate_next),
            ),
            ListDivider(),
          ],
        ));
  }
}
