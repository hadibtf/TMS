import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tms/services/schedule_service.dart';

class ScheduleViewModel extends ChangeNotifier {
  final ScheduleService _scheduleService;

  ScheduleViewModel(this._scheduleService) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime = DateTime.now();
      // We only need to notify listeners on the timing screen.
      // The other screens are static.
      if (selectedStation != null) {
        updateArrivals();
      }
    });
  }

  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  String? _selectedRoute;
  String? _selectedStation;
  List<String> _stationsForSelectedRoute = [];

  List<DateTime> _pastArrivals = [];
  DateTime? _nextArrival;
  List<DateTime> _upcomingArrivals = [];

  // Getters
  DateTime get currentTime => _currentTime;
  String? get selectedRoute => _selectedRoute;
  String? get selectedStation => _selectedStation;
  List<String> get stationsForSelectedRoute => _stationsForSelectedRoute;
  List<DateTime> get pastArrivals => _pastArrivals;
  DateTime? get nextArrival => _nextArrival;
  List<DateTime> get upcomingArrivals => _upcomingArrivals;

  // Setters
  void selectRoute(String routeName) {
    _selectedRoute = routeName;
    _stationsForSelectedRoute = _scheduleService.getStationsForRoute(routeName);
    _selectedStation = null; // Reset station when route changes
    notifyListeners();
  }

  void selectStation(String stationName) {
    _selectedStation = stationName;
    updateArrivals();
  }

  // Logic
  void updateArrivals() {
    if (_selectedRoute != null && _selectedStation != null) {
      _pastArrivals = _scheduleService.getPastArrivals(_selectedRoute!, _selectedStation!, _currentTime);
      _nextArrival = _scheduleService.getNextArrival(_selectedRoute!, _selectedStation!, _currentTime);
      _upcomingArrivals = _scheduleService.getUpcomingArrivals(_selectedRoute!, _selectedStation!, _currentTime);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}