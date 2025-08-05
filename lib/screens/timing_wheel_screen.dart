import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms/theme/design_constants.dart';
import 'package:tms/viewmodels/schedule_viewmodel.dart';
import 'package:tms/widgets/timing_wheel.dart';

class TimingWheelScreen extends StatelessWidget {
  const TimingWheelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Navigate back to station selection
            Navigator.of(context).pop();
          },
        ),
        title: const Text('ARRIVALS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Placeholder for search functionality
            },
          ),
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Highlight the Home icon
        onTap: (index) {
          // Placeholder for navigation
        },
      ),
    );
  }
}