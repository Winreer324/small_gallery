import 'package:alice/alice.dart';

class AppConst {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppConst._();

  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: true,
    darkTheme: false,
    maxCallsCount: 1000,
  );

  ///
  static const int defaultPage = 1;
  static const int limitItems = 14;

  ///
  static const int timeoutDurationInMilliseconds = 60 * 1000;
}
