import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';

class AppConst {
  static Alice alice = Alice(showNotification: !kReleaseMode, showInspectorOnShake: !kReleaseMode);

  ///
  static const int defaultPage = 1;
  static const int limitItems = 14;

  ///
  static const int timeoutDurationInMilliseconds = 60 * 1000;
}
