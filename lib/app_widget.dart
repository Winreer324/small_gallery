import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:small_gallery/app/resources/resources_imports.dart';
import 'app/ui/navigation/photo_imports.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.titleApp,
      theme: AppThemes.appTheme,
      home: const NavigationScreen(),
    );
  }
}
