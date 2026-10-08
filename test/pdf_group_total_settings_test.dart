import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/models/serializers.dart';

void main() {
  test('group total label survives company settings serialization', () {
    final company = CompanyEntity()
        .rebuild((b) => b..settings.pdfGroupTotalLabel = r'Subtotal $group');
    final data = serializers.serializeWith(CompanyEntity.serializer, company)
        as Map<String, dynamic>;
    expect(data['settings']['pdf_group_total_label'], r'Subtotal $group');
    final restored =
        serializers.deserializeWith(CompanyEntity.serializer, data)!;
    expect(restored.settings.pdfGroupTotalLabel, r'Subtotal $group');
  });

  test('older settings allow the translated default', () {
    final settings = serializers.deserializeWith(SettingsEntity.serializer,
        <String, dynamic>{'show_currency_code': false})!;
    expect(settings.pdfGroupTotalLabel, isNull);
    final configured =
        settings.rebuild((b) => b..pdfGroupTotalLabel = r'Group total $group');
    final merged = SettingsEntity(companySettings: configured);
    expect(merged.pdfGroupTotalLabel, r'Group total $group');
  });
}
