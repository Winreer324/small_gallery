part of 'bottom_navigation_bar_imports.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int selectedTab) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight + context.mediaQuery.padding.bottom,
      child: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItemWidget(
                iconPath: AppIcons.newNavigationBarSvg,
                label: 'infinity list',
              ),
              BottomNavigationBarItemWidget(
                iconPath: AppIcons.newNavigationBarSvg,
                label: 'counter',
              ),
              BottomNavigationBarItemWidget(
                iconPath: AppIcons.newNavigationBarSvg,
                label: AppStrings.newNavigationBar,
              ),
              BottomNavigationBarItemWidget(
                iconPath: AppIcons.popularNavigationBarSvg,
                label: AppStrings.popularNavigationBar,
              ),
              BottomNavigationBarItemWidget(
                iconData: Icons.person,
                label: AppStrings.settingsNavigationBar,
              ),
            ],
            currentIndex: currentIndex,
            onTap: onTap,
          ),
         const Align(
            alignment: Alignment.topCenter,
            child: Divider(color: AppColors.lightGray, height: 1),
          ),
        ],
      ),
    );
  }
}
