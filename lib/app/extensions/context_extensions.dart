part of app;

extension BuildContextExtension on BuildContext {
  Size get sizeScreen => MediaQuery.of(this).size;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
