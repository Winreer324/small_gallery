part of resources;

class AppThemes {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppThemes._();

  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.baseColor,
    accentColor: AppColors.subBaseColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.gray,
      selectionColor: AppColors.gray,
      selectionHandleColor: AppColors.gray,
    ),
    indicatorColor: AppColors.gray,
    appBarTheme: const AppBarTheme(color: Colors.white, brightness: Brightness.dark),
    cupertinoOverrideTheme: const CupertinoThemeData(primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
