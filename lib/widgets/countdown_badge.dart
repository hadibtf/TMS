import 'package:flutter/material.dart';
import 'package:tms/theme/design_constants.dart';

class TimeDifferenceBadge extends StatelessWidget {
  final Duration difference;

  const TimeDifferenceBadge({super.key, required this.difference});

  @override
  Widget build(BuildContext context) {
    // Don’t show past arrivals
    if (difference.isNegative) return const SizedBox.shrink();

    final minutes = difference.inMinutes;
    final seconds = difference.inSeconds.remainder(60);

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
        '${minutes}m${seconds.toString().padLeft(2, '0')}s',
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.sm,
        ),
      ),
    );
  }
}
