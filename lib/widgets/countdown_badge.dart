import 'package:flutter/material.dart';
import 'package:tms/theme/design_constants.dart';

class TimeDifferenceBadge extends StatelessWidget {
  final Duration difference;

  const TimeDifferenceBadge({super.key, required this.difference});

  @override
  Widget build(BuildContext context) {
    final minutes = difference.inMinutes;
    // Show only if the train has not yet arrived
    if (minutes < 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingSm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${minutes}m',
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.sm,
        ),
      ),
    );
  }
}