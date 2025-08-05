import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tms/services/schedule_service.dart';

// A mock AssetBundle to use for testing.
class MockAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/trains_schedule.json') {
      return '''
      {
        "routes": [
          {
            "name": "Test-Route",
            "stations": [
              {
                "name": "Test-Station",
                "schedule": ["10:00", "10:10", "10:20", "10:30", "10:40", "10:50"]
              }
            ]
          }
        ]
      }
      ''';
    }
    return '';
  }

  @override
  Future<ByteData> load(String key) async {
    final String string = await loadString(key);
    return ByteData.view(utf8.encoder.convert(string).buffer);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ScheduleService scheduleService;

  setUp(() async {
    // Provide the mock asset bundle to the service.
    scheduleService = ScheduleService(bundle: MockAssetBundle());
    await scheduleService.loadSchedule();
  });

  group('ScheduleService', () {
    test('getNextArrival returns the correct next time', () {
      final now = DateTime.parse('2023-01-01 10:15:00');
      final nextArrival = scheduleService.getNextArrival('Test-Route', 'Test-Station', now);
      expect(nextArrival, DateTime.parse('2023-01-01 10:20:00'));
    });

    test('getPastArrivals returns the correct past times', () {
      final now = DateTime.parse('2023-01-01 10:25:00');
      final pastArrivals = scheduleService.getPastArrivals('Test-Route', 'Test-Station', now, count: 2);
      expect(pastArrivals.length, 2);
      expect(pastArrivals, [
        DateTime.parse('2023-01-01 10:20:00'),
        DateTime.parse('2023-01-01 10:10:00'),
      ]);
    });

    test('getUpcomingArrivals returns the correct upcoming times', () {
      final now = DateTime.parse('2023-01-01 10:30:00');
      final upcomingArrivals = scheduleService.getUpcomingArrivals('Test-Route', 'Test-Station', now, count: 2);
      expect(upcomingArrivals.length, 2);
      expect(upcomingArrivals, [
        DateTime.parse('2023-01-01 10:40:00'),
        DateTime.parse('2023-01-01 10:50:00'),
      ]);
    });
  });
}