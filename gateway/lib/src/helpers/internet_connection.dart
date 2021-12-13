part of gateway;

class InternetConnection {
  static Future<bool> hasInternetConnectivity() async {
    final hasConnection = await DataConnectionChecker().hasConnection;

    return hasConnection;
  }
}
