import 'package:flutter/material.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';

class ContextHelper {
  MediaQueryData getMediaQuery(BuildContext context) => MediaQuery.of(context);

  Size getSizeScreen(BuildContext context) => context.sizeScreen;

  ThemeData getTheme(BuildContext context) => context.theme;
}
