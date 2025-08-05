import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms/viewmodels/schedule_viewmodel.dart';
import 'package:tms/widgets/station_card.dart';
import 'package:tms/theme/design_constants.dart';

class StationListScreen extends StatefulWidget {
  const StationListScreen({super.key});

  @override
  State<StationListScreen> createState() => _StationListScreenState();
}

class _StationListScreenState extends State<StationListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScheduleViewModel>(context);
    final filteredStations = viewModel.stationsForSelectedRoute
        .where((station) => station.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        automaticallyImplyLeading: false, // We might want a custom back button
        title: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingMd),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for a station',
              hintStyle: TextStyle(color: AppColors.textPrimaryDark.withOpacity(0.5)),
              prefixIcon: Icon(Icons.search, color: AppColors.textPrimaryDark.withOpacity(0.5)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
            style: TextStyle(color: AppColors.textPrimaryDark),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: AppDimensions.paddingMd),
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          final stationName = filteredStations[index];
          return StationCard(
            stationName: stationName,
            onTap: () {
              viewModel.selectStation(stationName);
              Navigator.pushNamed(context, '/timing');
            },
          );
        },
      ),
    );
  }
}