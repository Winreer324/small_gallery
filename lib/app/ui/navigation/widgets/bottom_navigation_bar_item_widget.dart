part of 'bottom_navigation_bar_imports.dart';

class BottomNavigationBarItemWidget extends BottomNavigationBarItem {
  BottomNavigationBarItemWidget({
    String? iconPath,
    IconData? iconData,
    String? label,
    String? tooltip,
    Color? backgroundColor,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: _iconBuild(iconData, iconPath, AppColors.gray),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: _iconBuild(iconData, iconPath, AppColors.baseColor),
          ),
          label: label,
          tooltip: tooltip,
          backgroundColor: backgroundColor,
        );

  static Widget _iconBuild(IconData? icon, String? iconPath, Color color) {
    if (icon != null) {
      return Icon(
        icon,
        color: color,
      );
    }
    if (iconPath != null) {
      return SvgPicture.asset(
        iconPath,
        color: color,
        width: AppWidgetConstants.navigationSizeIcon,
        height: AppWidgetConstants.navigationSizeIcon,
      );
    }

    return const SizedBox();
  }
}
