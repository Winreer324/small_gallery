import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_gallery/app/ui/theme/theme_cubit.dart';

class HandlerThemeWidget extends StatefulWidget {
  final Widget child;

  const HandlerThemeWidget({Key? key, required this.child}) : super(key: key);

  @override
  _HandlerThemeWidgetState createState() => _HandlerThemeWidgetState();
}

class _HandlerThemeWidgetState extends State<HandlerThemeWidget> {
  @override
  void initState() {
    super.initState();
    var window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance?.handlePlatformBrightnessChanged();
      //если мы меняем через настройки телефона, на темную
      // а потом переключаем на светлую в приложении
      // затем выключаем темную тему, в приложении будет пред. тема
      context.read<ThemeCubit>().changeThemeByBrightness(window.platformBrightness);
    };
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
