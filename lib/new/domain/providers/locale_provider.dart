import 'package:flutter/material.dart';
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    PrefUtils().saveLanguage(locale.languageCode);
    notifyListeners();
  }
}
