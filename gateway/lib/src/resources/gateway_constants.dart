part of gateway;

class GatewayConstants {
  static const int limitItems = 15;
  static const int defaultPage = 1;

  static const String baseUrl = "http://gallery.dev.webant.ru/api/";
  static const String basePathMedia = 'http://gallery.dev.webant.ru/media/';

  /// end point
  static const String photos = 'photos';

  /// keys
  static const String queryParametersPage = 'page';
  static const String queryParametersLimit = 'limit';
  static const String newType = 'New';
  static const String popularType = 'Popular';

  /// common
  static const String detail = 'detail';
  static const String errorDescription = 'error_description';
  static const String errorType = 'error';
}
