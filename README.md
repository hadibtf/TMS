# Metro Time Schedule App
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This Flutter application provides users with an intuitive and efficient way to check metro train schedules. It features a clean, user-friendly interface that allows for quick searches of train timings between various stations. The app is designed to be fast, reliable, and easy to navigate, ensuring a seamless experience for daily commuters and occasional travelers alike.

## Prerequisites

- Flutter SDK (Version 3.0.0 or higher)
- Android Studio or Visual Studio Code
- Platform-specific tools (Xcode for iOS, Android SDK for Android)

## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/tms-flutter-app.git
   cd tms-flutter-app
2. **Install dependencies:**
   ```bash
   flutter pub get
3. **Run the app:**
   ```bash
   flutter run

## Directory Structure

     ├── android
     ├── assets
     │   └── trains_schedule.json
     ├── build
     ├── ios
     ├── lib
     │   ├── main.dart
     │   ├── screens
     │   │   ├── direction_selection_screen.dart
     │   │   ├── station_list_screen.dart
     │   │   └── timing_wheel_screen.dart
     │   ├── services
     │   │   └── time_service.dart
     │   ├── theme
     │   │   └── theme.dart
     │   ├── viewmodels
     │   │   └── time_viewmodel.dart
     │   └── widgets
     │       └── station_list.dart
     ├── pubspec.lock
     └── pubspec.yaml


## Architecture Overview

The application follows a modern MVVM (Model-View-ViewModel) architecture, leveraging the `provider` package for state management. This approach ensures a clear separation of concerns, making the codebase modular, scalable, and easy to maintain.

- **Model**: Represents the data and business logic (e.g., `train_schedule.json`).
- **View**: The UI components of the application (e.g., screens and widgets).
- **ViewModel**: Acts as a bridge between the Model and the View, handling user interactions and managing the state.

## Features

- **Direction Selection**: Users can easily select their starting and destination stations.
- **Station List**: A comprehensive list of all available stations for quick selection.
- **Timing Wheel**: An innovative and user-friendly way to view train timings.

## Testing & CI

To run tests, use the following command:
  ```bash
  flutter test

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
