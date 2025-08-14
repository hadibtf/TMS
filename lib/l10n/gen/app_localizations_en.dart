// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TMS - Train Metro Schedule';

  @override
  String get directionElGoliToNoor => 'El-Goli to Noor';

  @override
  String get directionNoorToElGoli => 'Noor to El-Goli';

  @override
  String get searchStationHint => 'Search for a station';

  @override
  String get arrivalsTitle => 'Arrivals';

  @override
  String get noMoreTrains => 'No more trains today';

  @override
  String get languageEnglish => 'English';

  @override
  String get languagePersian => 'Persian';

  @override
  String get systemDefault => 'System default';

  @override
  String stationSubtitle(Object stationName) {
    return '$stationName Railway Station';
  }

  @override
  String timeBadge(int minutes, String secondsPadded) {
    return '${minutes}m${secondsPadded}s';
  }
}
