# Architecture

This document provides a high-level overview of the application's architecture.

## Component Diagram

The application is structured using the MVVM (Model-View-ViewModel) pattern.

```
+----------------+      +----------------+      +----------------+
|      View      |----->|   ViewModel    |----->|     Service    |
| (Screens/Widgets)|      | (State Management)|      | (Data Fetching)|
+----------------+      +----------------+      +----------------+
      ^                   |
      |                   v
      +-------------------+
      |      Model      |
      | (Data Structure)  |
      +-------------------+
```

## Data Flow

1.  **View (UI Layer)**: The user interacts with the UI, triggering events.
2.  **ViewModel (State Management)**: The ViewModel receives UI events and updates the application state.
3.  **Service (Data Fetching)**: The ViewModel communicates with services to fetch data (e.g., from the `trains_schedule.json` file).
4.  **Model (Data Structure)**: The fetched data is parsed into a data model.
5.  **State Update**: The ViewModel updates its state with the new data.
6.  **UI Update**: The UI listens for state changes in the ViewModel and rebuilds itself to reflect the new state.
