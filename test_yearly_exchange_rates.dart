import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/company_model.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';

void main() {
  test(
      'yearly exchange rates survive serialization and match year and currency',
      () {
    final company = CompanyEntity().rebuild((b) => b
      ..settings.currencyId = '1'
      ..yearlyExchangeRatesJson = jsonEncode([
        {
          'year': 2025,
          'currency_id': '2',
          'base_currency_id': '1',
          'rate': 0.93
        },
        {
          'year': 2026,
          'currency_id': '2',
          'base_currency_id': '1',
          'rate': 0.95
        },
        {
          'year': 2027,
          'currency_id': '2',
          'base_currency_id': '1',
          'rate': 0.97
        },
      ]));
    final restored = serializers.deserializeWith(
      CompanyEntity.serializer,
      serializers.serializeWith(CompanyEntity.serializer, company),
    )!;

    expect(restored.yearlyExchangeRate('2', '2025-12-31'), 0.93);
    expect(restored.yearlyExchangeRate('2', '2026-01-01'), 0.95);
    expect(restored.yearlyExchangeRate('2', '2026-12-31'), 0.95);
    expect(restored.yearlyExchangeRate('2', '2027-01-01'), 0.97);
    expect(restored.yearlyExchangeRate('2', '2024-12-31'), isNull);
    expect(restored.yearlyExchangeRate('3', '2026-01-01'), isNull);
    expect(restored.yearlyExchangeRate('2', null), isNull);
    expect(
        restored
            .rebuild((b) => b..settings.currencyId = '3')
            .yearlyExchangeRate('2', '2026-01-01'),
        isNull);
    expect(CompanyEntity().yearlyExchangeRate('2', '2026-01-01'), isNull);
  });
}
