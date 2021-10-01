import 'package:appname/src/services/counter_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The CounterController
/// uses the CounterService to store and retrieve user settings.
class CounterController with ChangeNotifier {
  CounterController(this._counterService);

  // Make CounterService a private variable so it is not used directly.
  final CounterService _counterService;

  // Make Counter a private variable so it is not updated directly without
  // also persisting the changes with the CounterService.
  late int _counter;

  // Allow Widgets to read the user's preferred Counter.
  int get counter => _counter;

  /// Load the user's settings from the CounterService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadCounter() async {
    _counter = await _counterService.counter();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the Counter based on the user's selection.
  void incrementCounter() async {

    // Otherwise, store the new theme mode in memory
    _counter = _counter+1;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // CounterService.
    await _counterService.updateCounter(_counter);
  }
}
