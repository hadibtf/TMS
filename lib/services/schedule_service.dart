import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// A raw data structure to hold the parsed JSON.
// This avoids the complexity of Freezed for this nested map structure.
typedef ScheduleData = Map<String, Map<String, List<String>>>;

/// A service that provides train schedule data.
class ScheduleService {
  final AssetBundle _bundle;
  Map<String, dynamic>? _rawData;

  ScheduleService({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  Future<void> loadSchedule() async {
    final String response = await _bundle.loadString('assets/trains_schedule.json');
    _rawData = json.decode(response);
  }

  List<String> getRouteNames() {
    if (_rawData == null) return [];
    final routes = _rawData!['routes'] as Map<String, dynamic>;
    return routes.keys.toList();
  }

  List<String> getStationsForRoute(String routeName) {
    if (_rawData == null) return [];
    final routeData = _rawData!['routes'][routeName] as Map<String, dynamic>?;
    if (routeData == null) return [];
    final stations = routeData['stations'] as Map<String, dynamic>?;
    return stations?.keys.toList() ?? [];
  }

  List<DateTime> _getAllArrivals(String routeName, String stationName, DateTime now) {
    if (_rawData == null) throw Exception("Schedule not loaded");

    final stationSchedule = _rawData!['routes'][routeName]?['stations']?[stationName] as List<dynamic>?;
    if (stationSchedule == null) return [];

    final DateFormat format = DateFormat("HH:mm");
    return stationSchedule.map((timeString) {
      final time = format.parse(timeString as String);
      return DateTime(now.year, now.month, now.day, time.hour, time.minute);
    }).toList()..sort();
  }

  List<DateTime> getPastArrivals(String routeName, String stationName, DateTime now, {int count = 3}) {
    final allArrivals = _getAllArrivals(routeName, stationName, now);
    return allArrivals.where((arrival) => arrival.isBefore(now)).toList().reversed.take(count).toList();
  }

  DateTime? getNextArrival(String routeName, String stationName, DateTime now) {
    final allArrivals = _getAllArrivals(routeName, stationName, now);
    final upcoming = allArrivals.where((arrival) => arrival.isAfter(now) || arrival.isAtSameMomentAs(now));
    return upcoming.isNotEmpty ? upcoming.first : null;
  }

  List<DateTime> getUpcomingArrivals(String routeName, String stationName, DateTime now, {int count = 3}) {
    final allArrivals = _getAllArrivals(routeName, stationName, now);
    return allArrivals.where((arrival) => arrival.isAfter(now) || arrival.isAtSameMomentAs(now)).skip(1).take(count).toList();
  }
}
