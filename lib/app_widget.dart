import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/resources/app_strings.dart';
import 'app/resources/app_themes.dart';
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
