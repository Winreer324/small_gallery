part of resources;

class AppThemes {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppThemes._();

  static final ThemeData appThemeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: AppColors.subBaseColor,
    primaryColorBrightness: Brightness.dark,
    backgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.backgroundDarkColor,
    ),

    /// color for InkWell
    splashColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    primaryColorLight: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: AppColors.greyTab,
      selectedItemColor: AppColors.baseColor,
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.baseDarkColor),
      ),
      brightness: Brightness.dark,
    ),
  );

  static final ThemeData appThemeDark = ThemeData(
    primaryColor: AppColors.baseDarkColor,
    accentColor: AppColors.baseColor,
    primaryColorBrightness: Brightness.dark,
    brightness: Brightness.dark,
    backgroundColor: AppColors.backgroundDarkColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.backgroundDarkColor,
    ),

    /// color for InkWell
    splashColor: AppColors.baseColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.baseDarkColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    primaryColorDark: AppColors.darkBlue,
    // primaryColorLight: AppColors.darkBlue,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.baseDarkColor,
      unselectedItemColor: AppColors.greyTab,
      selectedItemColor: AppColors.baseColor,
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.baseDarkColor),
      ),
      brightness: Brightness.dark,
    ),
  );
}
