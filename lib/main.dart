import 'src/controllers/bottom_navigation_controller.dart';
import 'src/services/bottom_navigation_service.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/controllers/settings_controller.dart';
import 'src/services/settings_service.dart';

void main() async {
  // Set up the Controller, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());
  final bottomNavigationController = BottomNavigationController(BottomNavigationService());

  // Load initial data while the splash screen is displayed.
  // This prevents a sudden change when the app is first displayed.
  await settingsController.loadSettings();
  await bottomNavigationController.loadBottomNavigation();
  // Run the app and pass in the Controller. The app listens to the
  // Controller for changes, then passes it further down to the View.
  runApp(MyApp(settingsController: settingsController,bottomNavigationController: bottomNavigationController,));
}
