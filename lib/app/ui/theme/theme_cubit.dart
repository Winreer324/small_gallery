import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  final ThemeData themeData;

  ThemeCubit(this.themeData) : super(ThemeState(themeData));

  void changeTheme(ThemeData currentTheme) {
    if (currentTheme.brightness == Brightness.light) {
      emit(ThemeState(AppThemes.appThemeDark));
    } else {
      emit(ThemeState(AppThemes.appThemeLight));
    }
  }

  void changeThemeByBrightness(Brightness brightness) {
    if (brightness == Brightness.dark) {
      emit(ThemeState(AppThemes.appThemeDark));
    } else {
      emit(ThemeState(AppThemes.appThemeLight));
    }
  }

  ThemeData getPlatformThemeData({
    required Brightness brightness,
  }) {
    return brightness == Brightness.dark ? AppThemes.appThemeDark : AppThemes.appThemeLight;
  }

  Brightness getPlatformThemeMode({
    required ThemeData currentTheme,
  }) {
    return currentTheme.brightness == Brightness.dark ? Brightness.dark : Brightness.light;
  }
}
