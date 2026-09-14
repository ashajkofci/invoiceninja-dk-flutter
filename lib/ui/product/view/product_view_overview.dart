// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/constants.dart';

// Project imports:
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/ui/app/FieldGrid.dart';
import 'package:invoiceninja_flutter/ui/app/entity_header.dart';
import 'package:invoiceninja_flutter/ui/app/lists/list_divider.dart';
import 'package:invoiceninja_flutter/ui/app/scrollable_listview.dart';
import 'package:invoiceninja_flutter/ui/product/view/product_view_vm.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_invoice_link.dart';
import 'package:intl/intl.dart';

class ProductOverview extends StatefulWidget {
  const ProductOverview({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ProductViewVM viewModel;

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  Future<Map<String, dynamic>?> _loadReservationStatus() async {
    final state = widget.viewModel.state;
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final response = await const WebClient().get(
      '${state.credentials.url}/product_reservations/availability?start_date=$today&end_date=$today&product_id=${widget.viewModel.product.id}',
      state.credentials.token,
    );
    final data = List<Map<String, dynamic>>.from(response['data']);
    return data.isEmpty ? null : data.first;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;
    final viewModel = widget.viewModel;
    final product = viewModel.product;
    final company = viewModel.company!;

    String tax = '';
    if (product.taxName1.isNotEmpty) {
      tax += formatNumber(product.taxRate1, context,
              formatNumberType: FormatNumberType.percent)! +
          ' ' +
          product.taxName1;
    }
    if (product.taxName2.isNotEmpty) {
      tax += ' ' +
          formatNumber(product.taxRate2, context,
              formatNumberType: FormatNumberType.percent)! +
          ' ' +
          product.taxName2;
    }

    final fields = <String?, String?>{
      localization.tax: tax,
    };

    if (company.calculateTaxes) {
      fields[localization.taxCategory] =
          localization.lookup(kTaxCategories[product.taxCategoryId]);
    }

    if (company.hasCustomField(CustomFieldType.product1) &&
        product.customValue1.isNotEmpty) {
      final label1 = company.getCustomFieldLabel(CustomFieldType.product1);
      fields[label1] = formatCustomValue(
          context: context,
          field: CustomFieldType.product1,
          value: product.customValue1);
    }

    if (company.hasCustomField(CustomFieldType.product2) &&
        product.customValue2.isNotEmpty) {
      final label2 = company.getCustomFieldLabel(CustomFieldType.product2);
      fields[label2] = formatCustomValue(
          context: context,
          field: CustomFieldType.product2,
          value: product.customValue2);
    }

    if (company.hasCustomField(CustomFieldType.product3) &&
        product.customValue3.isNotEmpty) {
      final label3 = company.getCustomFieldLabel(CustomFieldType.product3);
      fields[label3] = formatCustomValue(
          context: context,
          field: CustomFieldType.product3,
          value: product.customValue3);
    }

    if (company.hasCustomField(CustomFieldType.product4) &&
        product.customValue4.isNotEmpty) {
      final label4 = company.getCustomFieldLabel(CustomFieldType.product4);
      fields[label4] = formatCustomValue(
          context: context,
          field: CustomFieldType.product4,
          value: product.customValue4);
    }

    for (final field in [
      (CustomFieldType.product5, product.customValue5),
      (CustomFieldType.product6, product.customValue6),
      (CustomFieldType.product7, product.customValue7),
      (CustomFieldType.product8, product.customValue8),
    ]) {
      if (company.hasCustomField(field.$1) && field.$2.isNotEmpty) {
        fields[company.getCustomFieldLabel(field.$1)] = formatCustomValue(
          context: context,
          field: field.$1,
          value: field.$2,
        );
      }
    }

    if (company.trackInventory ||
        company.enabledModules & kModuleProductReservations != 0) {
      fields[localization.stockQuantity] = formatNumber(
          product.stockQuantity.toDouble(), context,
          formatNumberType: FormatNumberType.int);

      if (company.trackInventory && product.stockNotificationThreshold != 0) {
        fields[localization.notificationThreshold] = formatNumber(
            product.stockNotificationThreshold.toDouble(), context,
            formatNumberType: FormatNumberType.int);
      }
    }

    if (product.maxQuantity > 0) {
      fields[localization.maxQuantity] = formatNumber(
          product.maxQuantity.toDouble(), context,
          formatNumberType: FormatNumberType.int);
    }

    return ScrollableListView(
      children: <Widget>[
        EntityHeader(
          entity: product,
          label: localization.price,
          value: formatNumber(product.price, context, roundToPrecision: false),
          secondLabel: localization.cost,
          secondValue: company.enableProductCost
              ? formatNumber(product.cost, context, roundToPrecision: false)
              : null,
        ),
        ListDivider(),
        FieldGrid(fields),
        if (company.enabledModules & kModuleProductReservations != 0)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: FutureBuilder<Map<String, dynamic>?>(
              future: _loadReservationStatus(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return snapshot.connectionState == ConnectionState.done
                      ? SizedBox.shrink()
                      : LinearProgressIndicator();
                }
                final status = snapshot.data!;
                final tracked = status['is_stock_tracked'] == true;
                final reservations = List<Map<String, dynamic>>.from(
                    status['reservations'] ?? []);
                return ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(reservationText(context, 'currentStatus')),
                  subtitle: Text(tracked
                      ? '${status['reserved_quantity']} ${reservationText(context, 'reserved')} · ${status['available_quantity']} ${reservationText(context, 'available')}'
                      : reservationText(context, 'notTracked')),
                  leading: Icon(tracked
                      ? Icons.event_available
                      : Icons.inventory_2_outlined),
                  children: reservations.isEmpty
                      ? [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(reservationText(
                                context, 'noCurrentReservations')),
                          )
                        ]
                      : reservations
                          .map((reservation) => ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.receipt_long),
                                title: Text(
                                    '${reservationText(context, 'invoice')} #${reservation['invoice_number']} · ${reservation['client_name']}'),
                                subtitle: Text(
                                    '${reservation['start_date']} → ${reservation['end_date']} · ${reservation['quantity']} · ${reservation['status'] ?? ''}'),
                                onTap: () => openReservationInvoice(
                                  context,
                                  StoreProvider.of<AppState>(context),
                                  reservation['invoice_id']?.toString(),
                                ),
                              ))
                          .toList(),
                );
              },
            ),
          ),
        if (product.notes.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Text(
              product.notes,
              style: TextStyle(fontSize: 16),
            ),
          ),
        if (product.imageUrl.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Image.network(
              product.imageUrl,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        SizedBox(height: 20),
      ],
    );
  }
}
