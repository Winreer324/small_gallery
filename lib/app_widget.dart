import 'package:flutter/material.dart';
import 'package:small_gallery/app/resources/resources.dart';

import 'app/ui/navigation/photo_imports.dart';

class Gallery extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const Gallery({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.titleApp,
      theme: AppThemes.appTheme,
      navigatorKey: navigatorKey,
      home: const NavigationScreen(),
    );
  }
}
