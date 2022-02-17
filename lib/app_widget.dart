import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';

import 'app/ui/navigation/photo_imports.dart';

class Gallery extends StatefulWidget {
 const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final GlobalKey<NavigatorState> navigatorKey = GatewayConstants.alice.getNavigatorKey()!;

  @override
  Widget build(BuildContext context) {
    GatewayConstants.alice.setNavigatorKey(navigatorKey);
    return MaterialApp(
      title: AppStrings.titleApp,
      theme: AppThemes.appTheme,
      navigatorKey: GatewayConstants.alice.getNavigatorKey(),
      home: const NavigationScreen(),
    );
  }
}
