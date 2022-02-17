import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

export 'package:small_gallery/app/extensions/theme_data/theme_data_extension.dart';

extension BuildContextExtension on BuildContext {
  Size get sizeScreen => MediaQuery.of(this).size;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
}
