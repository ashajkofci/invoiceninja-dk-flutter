import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/ui/product_reservation/product_reservation_localization.dart';

InvoiceItemEntity item({
  String typeId = InvoiceItemEntity.TYPE_STANDARD,
  String groupId = '',
  double quantity = 1,
  double cost = 0,
  double timeCoefficient = 1,
}) =>
    (InvoiceItemEntityBuilder()
          ..productKey = ''
          ..notes = ''
          ..cost = cost
          ..quantity = quantity
          ..timeCoefficient = timeCoefficient
          ..timeCoefficientName = ''
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
  TestWidgetsFlutterBinding.ensureInitialized();

  test('group quantity multiplies invoice and quote totals', () {
    final group = item(
      typeId: InvoiceItemEntity.TYPE_GROUP,
      groupId: 'group-a',
      quantity: 2,
      timeCoefficient: 3,
    );
    final child = item(groupId: 'group-a', cost: 10);
    final invoice = InvoiceEntity().rebuild(
      (b) => b..lineItems.addAll([group, child]),
    );

    expect(group.total(invoice, 2), 60);
    expect(invoice.calculateSubtotal(precision: 2), 60);

    final standardGroup = group.rebuild((b) => b
      ..timeCoefficient = resolveTimeCoefficient('', const [], 3)
      ..timeCoefficientName = '');
    final standardInvoice =
        invoice.rebuild((b) => b..lineItems[0] = standardGroup);
    expect(standardInvoice.calculateSubtotal(precision: 2), 20);
  });
}
