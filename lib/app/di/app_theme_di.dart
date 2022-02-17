import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';

@module
abstract class AppThemeDi {
  @Named('lightTheme')
  @LazySingleton()
  ThemeData get lightTheme => AppThemes.appThemeLight;

  @Named('darkTheme')
  @LazySingleton()
  ThemeData get darkTheme => AppThemes.appThemeDark;
}
