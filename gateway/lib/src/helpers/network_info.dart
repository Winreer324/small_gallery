part of gateway;

class NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
