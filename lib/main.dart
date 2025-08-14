import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms/l10n/gen/app_localizations.dart';
import 'package:tms/viewmodels/locale_viewmodel.dart';
import 'package:tms/screens/direction_selection_screen.dart';
import 'package:tms/screens/station_list_screen.dart';
import 'package:tms/screens/timing_wheel_screen.dart';
import 'package:tms/services/schedule_service.dart';
import 'package:tms/theme/app_theme.dart';
import 'package:tms/viewmodels/schedule_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final scheduleService = ScheduleService();
  await scheduleService.loadSchedule();

  runApp(MyApp(scheduleService: scheduleService));
}

class MyApp extends StatelessWidget {
  final ScheduleService scheduleService;

  const MyApp({super.key, required this.scheduleService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleViewModel(scheduleService)),
        ChangeNotifierProvider(create: (_) => LocaleViewModel()),
      ],
      child: Consumer<LocaleViewModel>(
        builder: (context, localeVM, _) => MaterialApp(
          locale: localeVM.locale,
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const DirectionSelectionScreen(),
            '/stations': (context) => const StationListScreen(),
            '/timing': (context) => const TimingWheelScreen(),
          },
        ),
      ),
    );
  }
}
