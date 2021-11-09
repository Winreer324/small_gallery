import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:small_gallery/app/resources/app_colors.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle blackMajorText = GoogleFonts.roboto(fontSize: 15, color: Colors.black);

  static final TextStyle grayMajorText = GoogleFonts.roboto(fontSize: 15, color: AppColors.gray);

  static final TextStyle lightGrayMajorText = GoogleFonts.roboto(fontSize: 15, color: AppColors.lightGray);

  static final TextStyle grayText = GoogleFonts.roboto(fontSize: 12, color: AppColors.gray);

  static final TextStyle blackText = GoogleFonts.roboto(fontSize: 12, color: Colors.black);

  static final TextStyle titleAppBar = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.subBaseColor,
    fontWeight: FontWeight.w500,
  );
}
