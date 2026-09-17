// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

// Project imports:
import 'package:invoiceninja_flutter/constants.dart';
import 'package:invoiceninja_flutter/utils/i18n.dart';

class AppLocalization extends LocaleCodeAware with LocalizationsProvider {
  AppLocalization(this.locale) : super(locale.toString());

  final Locale locale;

  static Locale createLocale(String? locale) {
    final languageCode = locale?.split('_').first;
    if (!kLanguages.contains(languageCode)) {
      return Locale('en');
    }

    return Locale(languageCode!);
  }

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => kLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
