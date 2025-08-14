import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms/theme/design_constants.dart';
import 'package:tms/viewmodels/schedule_viewmodel.dart';
import 'package:tms/widgets/timing_wheel.dart';
import 'package:tms/l10n/gen/app_localizations.dart';

class TimingWheelScreen extends StatelessWidget {
  const TimingWheelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to station selection
            Navigator.of(context).pop();
          },
        ),
        title: Text(AppLocalizations.of(context).arrivalsTitle),
      ),
      body: Center(
        child: Consumer<ScheduleViewModel>(
          builder: (context, viewModel, child) {
            // Trigger updates on the view model
            viewModel.updateArrivals();
            return TimingWheel(
              past: viewModel.pastArrivals,
              next: viewModel.nextArrival,
              upcoming: viewModel.upcomingArrivals,
              currentTime: viewModel.currentTime,
            );
          },
        ),
      ),
    );
  }
}
