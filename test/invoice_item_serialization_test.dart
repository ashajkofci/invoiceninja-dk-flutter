import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/invoice_model.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';

void main() {
  test('defaults newer custom fields when loading legacy invoice items', () {
    final item = InvoiceItemEntityBuilder()
      ..productKey = 'Service'
      ..notes = ''
      ..cost = 10
      ..quantity = 1
      ..taxName1 = ''
      ..taxRate1 = 0
      ..taxName2 = ''
      ..taxRate2 = 0
      ..taxName3 = ''
      ..taxRate3 = 0
      ..customValue1 = ''
      ..customValue2 = ''
      ..customValue3 = ''
      ..customValue4 = ''
      ..discount = 0;
    final data = serializers.serializeWith(
      InvoiceItemEntity.serializer,
      item.build(),
    ) as Map<String, dynamic>
      ..remove('custom_value5')
      ..remove('custom_value6')
      ..remove('custom_value7')
      ..remove('custom_value8');

    final restored = serializers.deserializeWith(
      InvoiceItemEntity.serializer,
      data,
    )!;

    expect(restored.customValue5, '');
    expect(restored.customValue8, '');
  });
}
