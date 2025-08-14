import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleViewModel extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  static const _prefKey = 'app_locale_code';

  LocaleViewModel() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefKey);
    if (code == null || code.isEmpty || code == 'system') {
      _locale = null; // system default
    } else {
      _locale = Locale(code);
    }
    notifyListeners();
  }

  Future<void> setLocale(Locale? locale) async {
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.setString(_prefKey, 'system');
    } else {
      await prefs.setString(_prefKey, locale.languageCode);
    }
    notifyListeners();
  }

  Future<void> setSystemDefault() => setLocale(null);
}
