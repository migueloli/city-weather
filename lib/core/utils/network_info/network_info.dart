abstract class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;
  Stream<bool> get onConnectionChange;
}
