import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'package:small_gallery/app/ui/theme/theme_cubit.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            GatewayConstants.alice.showInspector();
          },
          child: Text(
            AppStrings.settingsNavigationBar,
            style: AppTextStyles.titleAppBar.copyWith(
              color: context.theme.backIconAppBar,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Row(
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
      ),
    );
  }
}
