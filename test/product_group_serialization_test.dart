import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';

void main() {
  test('serializes product group members for saving', () {
    final child = ProductGroupItemEntity((b) => b
      ..productId = 'child_hash'
      ..quantity = 2
      ..productKey = 'Child'
      ..notes = ''
      ..cost = 1
      ..price = 3
      ..taxCategoryId = '1'
      ..taxName1 = ''
      ..taxRate1 = 0
      ..taxName2 = ''
      ..taxRate2 = 0
      ..taxName3 = ''
      ..taxRate3 = 0
      ..customValue1 = ''
      ..customValue2 = ''
      ..customValue3 = ''
      ..customValue4 = '');
    final product = ProductEntity().rebuild((b) => b
      ..isGroup = true
      ..groupItems.add(child));

    final data = serializers.serializeWith(ProductEntity.serializer, product)
        as Map<String, dynamic>;

    expect(data['group_items'], [
      containsPair('product_id', 'child_hash'),
    ]);
    expect(data['group_items'][0]['quantity'], 2);
  });
}
