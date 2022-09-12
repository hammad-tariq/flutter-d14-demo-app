abstract class NetworkInfo {
  bool get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  NetworkInfoImpl();

  /// TODO: For now i am returning true means network is connected
  /// TODO: This has to be updated.
  @override
  bool get isConnected => true;
}
