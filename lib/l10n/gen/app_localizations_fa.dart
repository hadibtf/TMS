// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'برنامه زمان‌بندی مترو';

  @override
  String get directionElGoliToNoor => 'ائل‌گلی به نور';

  @override
  String get directionNoorToElGoli => 'نور به ائل‌گلی';

  @override
  String get searchStationHint => 'جستجوی ایستگاه';

  @override
  String get arrivalsTitle => 'ورودها';

  @override
  String get noMoreTrains => 'امروز قطاری باقی نمانده است';

  @override
  String get languageEnglish => 'انگلیسی';

  @override
  String get languagePersian => 'فارسی';

  @override
  String get systemDefault => 'تنظیمات پیش‌ فرض سیستم';

  @override
  String stationSubtitle(Object stationName) {
    return 'ایستگاه $stationName';
  }

  @override
  String timeBadge(int minutes, String secondsPadded) {
    return '$minutesد$secondsPaddedث';
  }
}
