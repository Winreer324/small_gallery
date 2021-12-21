part of resources;

class AppTextStyles {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppTextStyles._();

  static final TextStyle lightBlackText = GoogleFonts.roboto(fontSize: 12, color: AppColors.lightBlack);

  static final TextStyle textMajorSubColor = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.subBaseColor,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textMinorSubColor = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.gray,
  );

  static final TextStyle titleAppBar = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.subBaseColor,
    fontWeight: FontWeight.w500,
  );
}
