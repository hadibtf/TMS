import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tms/theme/design_constants.dart';
import 'package:tms/widgets/countdown_badge.dart';

class TimingWheel extends StatelessWidget {
  final List<DateTime> past;
  final DateTime? next;
  final List<DateTime> upcoming;
  final DateTime currentTime;

  const TimingWheel({
    super.key,
    required this.past,
    required this.next,
    required this.upcoming,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');

    // Helper to build the text style for times
    TextStyle _getTimeStyle(double size, double opacity) {
      return TextStyle(
        fontSize: size,
        color: AppColors.textPrimary.withOpacity(opacity),
        fontWeight: size == AppFontSizes.xl ? FontWeight.bold : FontWeight.w300,
      );
    }

    // Helper to build a time row, applying blur
    Widget _buildTimeRow(String formattedTime, double fontSize, double opacity, {bool isNext = false}) {
      final blurValue = isNext ? 0.0 : (4.0 - (fontSize / AppFontSizes.lg * 4.0));
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
          child: Text(formattedTime, style: _getTimeStyle(fontSize, opacity)),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Past Times (fading out)
        if (past.isNotEmpty)
          ...past.reversed.map((time) {
            int index = past.indexOf(time);
            double opacity = AppOpacities.faded - (index * 0.2);
            double fontSize = AppFontSizes.lg - (index * 6.0);
            return _buildTimeRow(timeFormat.format(time), fontSize, opacity.clamp(0.2, 1.0));
          }).toList(),

        // Next Arrival Time (the main event)
        if (next != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(timeFormat.format(next!), style: _getTimeStyle(AppFontSizes.xl, 1.0)),
                const SizedBox(width: AppDimensions.paddingMd),
                TimeDifferenceBadge(difference: next!.difference(currentTime)),
              ],
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text("No more trains today", style: _getTimeStyle(AppFontSizes.lg, 1.0)),
          ),

        // Upcoming Times (fading in)
        if (upcoming.isNotEmpty)
          ...upcoming.map((time) {
            int index = upcoming.indexOf(time);
            double opacity = AppOpacities.faded - (index * 0.2);
            double fontSize = AppFontSizes.lg - (index * 6.0);
            return _buildTimeRow(timeFormat.format(time), fontSize, opacity.clamp(0.2, 1.0));
          }).toList(),
      ],
    );
  }
}