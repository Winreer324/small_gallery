part of gateway;

@injectable
class NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
