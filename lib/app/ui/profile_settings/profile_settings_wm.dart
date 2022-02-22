import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:small_gallery/app/ui/elementary/counter/counter_screen.dart';
import 'package:small_gallery/app/ui/elementary/infinity_list/infinity_list_screen.dart';
import 'package:small_gallery/app/ui/helpers/context_helper.dart';
import 'package:small_gallery/app/ui/helpers/navigation_helper.dart';
import 'package:small_gallery/app/ui/profile_settings/profile_settings_model.dart';
import 'package:small_gallery/app/ui/profile_settings/profile_settings_screen.dart';

class ProfileSettingsScreenWM extends WidgetModel<ProfileSettingsScreen, ProfileSettingsModel>
    implements IProfileSettingsWm {
  final ContextHelper _contextHelper;
  final NavigationHelper _navigationHelper;

  ProfileSettingsScreenWM(this._contextHelper, ProfileSettingsModel model, this._navigationHelper) : super(model);

  @override
  Size get sizeScreen => _contextHelper.getSizeScreen(context);

  @override
  ThemeData get theme => _contextHelper.getTheme(context);

  @override
  Future<void> routeToCounterSample() async {
    _navigationHelper.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const CounterScreen(),
      ),
    );
  }

  @override
  Future<void> routeToInfinityListSample() async {
    _navigationHelper.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const InfinityListScreen(),
      ),
    );
  }
}

ProfileSettingsScreenWM createProfileSettingsScreenWM(BuildContext context) => ProfileSettingsScreenWM(
      ContextHelper(),
      ProfileSettingsModel(),
      NavigationHelper(),
    );

abstract class IProfileSettingsWm extends IWidgetModel {
  Size get sizeScreen;

  ThemeData get theme;

  Future<void> routeToCounterSample();

  Future<void> routeToInfinityListSample();
}
