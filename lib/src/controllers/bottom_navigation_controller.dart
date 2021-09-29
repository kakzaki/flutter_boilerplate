import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/bottom_navigation_service.dart';

/// A class that many Widgets can interact with to read user bottomNavigation, update
/// user bottomNavigation, or listen to user bottomNavigation changes.
///
/// Controllers glue Data Services to Flutter Widgets. The BottomNavigationController
/// uses the BottomNavigationService to store and retrieve user bottomNavigation.
class BottomNavigationController with ChangeNotifier {
  BottomNavigationController(this._bottomNavigationService);

  // Make BottomNavigationService a private variable so it is not used directly.
  final BottomNavigationService _bottomNavigationService;

  // Make Index a private variable so it is not updated directly without
  // also persisting the changes with the BottomNavigationService.
  late int _index;

  // Allow Widgets to read the user's preferred Index.
  int get index => _index;

  /// Load the user's bottomNavigation from the BottomNavigationService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// bottomNavigation from the service.
  Future<void> loadBottomNavigation() async {
    _index = await _bottomNavigationService.index();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the Index based on the user's selection.
  Future<void> updateIndex(int? newIndex) async {
    if (newIndex == null) return;

    // Dot not perform any work if new and old Index are identical
    if (newIndex == _index) return;

    // Otherwise, store the new theme mode in memory
    _index = newIndex;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // BottomNavigationService.
    await _bottomNavigationService.update(newIndex);
  }
}
