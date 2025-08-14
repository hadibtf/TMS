import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms/l10n/gen/app_localizations.dart';
import 'package:tms/theme/design_constants.dart';
import 'package:tms/viewmodels/schedule_viewmodel.dart';

class DirectionSelectionScreen extends StatelessWidget {
  const DirectionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDirectionPane(
            context: context,
            routeName: 'El-Goli-To-Noor',
            title: AppLocalizations.of(context).directionElGoliToNoor,
            backgroundColor: AppColors.lightBackground,
            textColor: AppColors.textPrimaryDark,
          ),
          Container(height: 2, color: AppColors.divider.withOpacity(0.5)),
          _buildDirectionPane(
            context: context,
            routeName: 'Noor-To-El-Goli',
            title: AppLocalizations.of(context).directionNoorToElGoli,
            backgroundColor: Colors.white,
            textColor: AppColors.textPrimaryDark,
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionPane({
    required BuildContext context,
    required String routeName,
    required String title,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Provider.of<ScheduleViewModel>(context, listen: false).selectRoute(routeName);
          Navigator.pushNamed(context, '/stations');
        },
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
