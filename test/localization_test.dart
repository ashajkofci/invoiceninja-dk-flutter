import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

void main() {
  test('supported regional locales use their base language', () {
    expect(AppLocalization.createLocale('en_GB'), const Locale('en'));
    expect(AppLocalization.createLocale('fr_CH'), const Locale('fr'));
    expect(AppLocalization.createLocale('de_CH'), const Locale('de'));
    expect(AppLocalization.createLocale('da_DK'), const Locale('en'));

    for (final language in ['en', 'fr', 'de']) {
      expect(AppLocalization(Locale(language)).lookup('invoice'), isNotEmpty);
    }
    expect(
      AppLocalization(const Locale('fr'))
          .lookup('invoice', overrideLocaleCode: 'da_DK'),
      AppLocalization(const Locale('en')).lookup('invoice'),
    );
  });
}
