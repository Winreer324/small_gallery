import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modi/app/extensions/localization_extensions.dart';

import 'di/injection.dart';

class AppNavigator {

  /// Common

  static _pushAndRemoveUntilPage(BuildContext context, Widget page) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  static _pushToPage(BuildContext context, Widget page, {bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
