part of app;

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<NavigatorState> navigatorKey = AppConst.alice.getNavigatorKey() ?? GlobalKey<NavigatorState>();
    // AppConst.alice.setNavigatorKey(navigatorKey);
    return MaterialApp(
      title: AppStrings.titleApp,
      theme: AppThemes.appTheme,
      // navigatorKey:AppConst. alice.getNavigatorKey(),
      // navigatorKey: navigatorKey,
      home: const NavigationScreen(),
    );
  }
}
