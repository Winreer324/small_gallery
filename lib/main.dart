import 'dart:async';

import 'package:flutter/material.dart';
import 'package:small_gallery/app/resources/resources.dart';

import 'app/di/injection.dart';
import 'app/ui/navigation/photo_imports.dart';

void main() async {
  // set di
  await setInjections();
  // local storage
  // await setHiveProperties();
  // final GlobalKey<NavigatorState> navigatorKey = AppConst.alice.getNavigatorKey()!;

  /// init end
  runZonedGuarded(
    () => runApp(Gallery()),
    // () => runApp(Gallery(navigatorKey: navigatorKey)),
    (_, __) {},
  );
}

class Gallery extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const Gallery({Key? key,   this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppConst.alice.setNavigatorKey(navigatorKey);
    return MaterialApp(
      title: AppStrings.titleApp,
      theme: AppThemes.appTheme,
      navigatorKey: navigatorKey,
      home: const NavigationScreen(),
    );
  }
}
