import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/repositories/product_repository.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';
import 'package:http/http.dart';

void main() {
  test('serializes product group members for saving', () {
    final child = _child();
    final product = ProductEntity().rebuild((b) => b
      ..isGroup = true
      ..groupItems.add(child));

    final data = serializers.serializeWith(ProductEntity.serializer, product)
        as Map<String, dynamic>;

    expect(data['group_items'], [
      containsPair('product_id', 'child_hash'),
    ]);
    expect(data['group_items'][0]['quantity'], 2);

    final legacyItem = Map<String, dynamic>.from(
      data['group_items'][0] as Map<String, dynamic>,
    )
      ..remove('custom_value5')
      ..remove('custom_value6')
      ..remove('custom_value7')
      ..remove('custom_value8');
    final restored = serializers.deserializeWith(
      ProductGroupItemEntity.serializer,
      legacyItem,
    )!;

    expect(restored.customValue5, '');
    expect(restored.customValue8, '');
  });

  test('posts group members when creating a product', () async {
    final product = ProductEntity().rebuild((b) => b
      ..productKey = 'Group'
      ..isGroup = true
      ..groupItems.add(_child()));
    final webClient = _RecordingWebClient(
      response: {
        'data': serializers.serializeWith(
          ProductEntity.serializer,
          product.rebuild((b) => b..id = 'group_hash'),
        ),
      },
    );

    final saved = await ProductRepository(webClient: webClient).saveData(
      const Credentials(url: 'https://example.com/api/v1', token: 'token'),
      product,
    );

    expect(webClient.url, 'https://example.com/api/v1/products');
    expect(webClient.body['is_group'], isTrue);
    expect(webClient.body['group_items'], [
      containsPair('product_id', 'child_hash'),
    ]);
    expect(saved.groupItems.single.productId, 'child_hash');
  });
}

ProductGroupItemEntity _child() => ProductGroupItemEntity((b) => b
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
  ..customValue4 = ''
  ..customValue5 = ''
  ..customValue6 = ''
  ..customValue7 = ''
  ..customValue8 = '');

class _RecordingWebClient extends WebClient {
  _RecordingWebClient({required this.response});

  final dynamic response;
  String? url;
  late Map<String, dynamic> body;

  @override
  Future<dynamic> post(
    String url,
    String? token, {
    dynamic data,
    List<MultipartFile>? multipartFiles,
    String? secret,
    String? password,
    String? idToken,
    bool rawResponse = false,
  }) async {
    this.url = url;
    body = jsonDecode(data as String) as Map<String, dynamic>;
    return response;
  }
}
