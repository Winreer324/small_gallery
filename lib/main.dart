import 'package:flutter/material.dart';
import 'package:small_gallery/app_widget.dart';

import 'app/di/injection.dart';
import 'app/resources/resources.dart';

void main() async {
  // set di
  await setInjections();

  final GlobalKey<NavigatorState> navigatorKey = AppConst.alice.getNavigatorKey()!;
  AppConst.alice.setNavigatorKey(navigatorKey);

  runApp(Gallery(navigatorKey: navigatorKey));
}
