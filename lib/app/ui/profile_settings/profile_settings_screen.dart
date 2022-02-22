import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'package:small_gallery/app/ui/profile_settings/profile_settings_wm.dart';
import 'package:small_gallery/app/ui/theme/theme_cubit.dart';

class ProfileSettingsScreen extends ElementaryWidget<IProfileSettingsWm> {
  const ProfileSettingsScreen({
    Key? key,
    WidgetModelFactory<ProfileSettingsScreenWM> wmFactory = createProfileSettingsScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IProfileSettingsWm wm) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            GatewayConstants.alice.showInspector();
          },
          child: Text(
            AppStrings.settingsNavigationBar,
            style: AppTextStyles.titleAppBar.copyWith(
              color: wm.theme.backIconAppBar,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Theme is light'),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Switch(
                      onChanged: (value) {
                        context.read<ThemeCubit>().changeTheme(context.theme);
                      },
                      value: state.themeData.brightness == Brightness.light ? true : false,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text('Примеры на elementary'),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: wm.routeToCounterSample, child: const Text('Counter')),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: wm.routeToInfinityListSample, child: const Text('Infinity List')),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
