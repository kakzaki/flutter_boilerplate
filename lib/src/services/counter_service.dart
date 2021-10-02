
/// A service that stores and retrieves counter state.
///
/// By default, this class does not persist counter state. If you'd like to
/// persist the counter state locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class CounterService {
  /// Loads the User's preferred Counter from local or remote storage.
  int? counter() => 0;

  /// Persists the user's preferred Counter to local or remote storage.
  void updateCounter(int counter) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
