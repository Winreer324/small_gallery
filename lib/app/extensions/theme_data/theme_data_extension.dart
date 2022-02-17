import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';

extension AppThemeData on ThemeData {
  bool get isLightMode => brightness == Brightness.light;

  TextStyle getSwitcherTextColor(bool isSelected) => isLightMode
      ? AppTextStyles.baseBlockTitleText
      : isSelected
          ? AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.textDarkColor)
          : AppTextStyles.baseBlockTitleText;

  Color? get selectedWindowColor => isLightMode ? AppColors.subBaseColor : AppColors.baseDarkColor;

  Color get reversedColor => isLightMode ? AppColors.darkColor : Colors.white;

  Color get secondaryButtonColor => isLightMode ? AppColors.subBaseColor : AppColors.backgroundDarkColor;

  Color get unBackgroundSwitchColor => isLightMode ? AppColors.greySwitcherLight : AppColors.backgroundDarkColor;

  Color get backgroundSwitchColor => isLightMode ? AppColors.lightOrange : AppColors.backgroundDarkColor;

  Color get checkedSwitchColor => isLightMode ? AppColors.baseColor : AppColors.darkBlue;

  Color get unCheckedSwitchColor => isLightMode ? AppColors.greySwitcherDark : AppColors.baseDarkColor;

  Color get servicesPriceColor => isLightMode ? AppColors.basketColor : AppColors.darkBlue;

  Color get highlightShimmerColor => isLightMode ? AppColors.lightGrey : AppColors.darkShimmer;

  Color get baseShimmerColor => isLightMode ? Colors.white : AppColors.darkLightShimmer;

  TextStyle get secondaryButtonTextStyle => isLightMode
      ? AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.textDarkColor)
      : AppTextStyles.baseBlockTitleText.copyWith(color: Colors.white);

  TextStyle get discountPriceTextStyle => isLightMode
      ? AppTextStyles.baseBlockTitleText.copyWith(color: Colors.white)
      : AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.textDarkColor);

  TextStyle get selectedAnswerTextStyle => isLightMode
      ? AppTextStyles.baseBlockTitleText
      : AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.textDarkColor);

  TextStyle get unsSelectedAnswerTextStyle => isLightMode
      ? AppTextStyles.baseBlockTitleText
      : AppTextStyles.baseBlockTitleText.copyWith(color: AppColors.darkBlue);

  Color get disabledButtonColor => isLightMode ? AppColors.grey : AppColors.darkBlue;

  Color get starColor => isLightMode ? AppColors.darkColor : AppColors.darkBlue;

  Color get contrastStarColor => isLightMode ? AppColors.darkColor : Colors.white;

  Color get masterStarColor => isLightMode ? AppColors.lightColor : AppColors.darkBlue;

  Color get dotColor => isLightMode ? AppColors.hintTextColor : AppColors.darkBlue;

  Color get primaryDotColor => isLightMode ? AppColors.darkColor : Colors.white;

  Color get bottomPopOverColor => isLightMode ? AppColors.basketColor : AppColors.darkBlue;

  // String get entryBackgroundImage => isLightMode ? AppAssets.entryBackground : AppAssets.entryDarkBackground;

  Color get selectedServiceIconColor => isLightMode ? AppColors.darkColor : Colors.white;

  Color get selectedCalendarCellTextColor => isLightMode ? Colors.white : AppColors.darkColor;

  // Decoration get todayCalendarCellDecoration =>
  //     isLightMode ? CalendarStyle().todayDecoration : CalendarStyle().todayDarkDecoration;

  Color get studioServiceColor => isLightMode ? AppColors.subBaseColor : AppColors.backgroundDarkColor;

  Color get photoIndicatorColor => isLightMode ? AppColors.grey : AppColors.baseDarkColor;

  Color get dateColor => isLightMode ? AppColors.darkColor : AppColors.darkBlue;

  // String get emptyImagePath => isLightMode ? AppAssets.baseEmptyImage : AppAssets.baseDarkEmptyImage;

  Color get avatarInitialsColor => isLightMode ? AppColors.baseColor : AppColors.darkBlue;

  Color get avatarBackgroundColor => isLightMode ? AppColors.subBaseColor : AppColors.backgroundDarkColor;

  Color get appBarColor => isLightMode ? AppColors.textDarkColor : Colors.white;

  Color get introductionButtonColor => isLightMode ? Colors.white : AppColors.baseDarkColor;

  Color get backIconAppBar => isLightMode ? AppColors.subBaseColor : Colors.white;

  Color get titleAppBar => isLightMode ? AppColors.subBaseColor : Colors.white;

  Color get titleBaseText => isLightMode ? AppColors.subBaseColor : Colors.white;

  // String get firstIntroductionImage =>
  //     isLightMode ? AppAssets.firstIntroductionImage : AppAssets.firstIntroductionDarkImage;
  //
  // String get secondIntroductionImage =>
  //     isLightMode ? AppAssets.secondIntroductionImage : AppAssets.secondIntroductionDarkImage;
  //
  // String get thirdIntroductionImage =>
  //     isLightMode ? AppAssets.thirdIntroductionImage : AppAssets.thirdIntroductionDarkImage;

  SystemUiOverlayStyle get systemUiOverlayStyle => isLightMode ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;
}
