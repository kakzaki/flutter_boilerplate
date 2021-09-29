

/// A service that stores and retrieves bottom navigation.
///
/// By default, this class does not persist bottom navigation. If you'd like to
/// persist the bottom navigation locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class BottomNavigationService {
  /// Loads the index from local or remote storage.
  Future<int> index() async => 0;

  /// Persists the index to local or remote storage.
  Future<void> update(int index) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
