import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'package:small_gallery/app/ui/theme/handler_theme_widget.dart';
import 'package:small_gallery/app/ui/theme/theme_cubit.dart';

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
    return BlocProvider(
      create: (context) => ThemeCubit(
        context.theme.brightness == Brightness.light ? AppThemes.appThemeLight : AppThemes.appThemeDark,
      ),
      child: HandlerThemeWidget(
        child: Builder(builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: AppStrings.titleApp,
                // theme: state.themeData,
                theme: AppThemes.appThemeLight,
                darkTheme: AppThemes.appThemeDark,
                // если нужо брать тему телефона, убрать это поле
                themeMode: state.themeData.brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
                navigatorKey: GatewayConstants.alice.getNavigatorKey(),
                home: const NavigationScreen(),
              );
            },
          );
        }),
      ),
    );
  }
}
