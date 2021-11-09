class ApiConstants {
  static const String baseUrl = "http://gallery.dev.webant.ru/api";

  static const int limitItems = 15;
  static const int defaultPage = 1;

  /// end point
  static const String photos = 'photos';

  /// keys
  static const String queryParametersPage = 'page';
  static const String queryParametersLimit = 'limit';
  static const String newType = 'New';
  static const String popularType = 'Popular';

  /// common
  static const String invalidRefreshToken = "Invalid refresh token";
  static const String userBlocked = 'Ваш аккаунт заблокирован';
  static const String invalidGrant = 'invalid_grant';
  static const String accessTokenProvidedHasExpired = 'The access token provided has expired.';
  static const String detail = 'detail';
  static const String errorDescription = 'error_description';
  static const String errorType = 'error';
}
