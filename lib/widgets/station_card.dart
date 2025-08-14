import 'package:flutter/material.dart';
import 'package:tms/theme/design_constants.dart';
import 'package:tms/l10n/gen/app_localizations.dart';

class StationCard extends StatelessWidget {
  final String stationName;
  final VoidCallback onTap;

  const StationCard({
    super.key,
    required this.stationName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // Ensures the image respects the border radius
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for the station image
            Container(
              height: 120,
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(
                  Icons.train,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stationName,
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context).stationSubtitle(stationName),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimaryDark.withOpacity(0.6)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
