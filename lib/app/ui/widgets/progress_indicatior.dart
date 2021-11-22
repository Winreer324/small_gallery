import 'package:flutter/material.dart';
import 'package:small_gallery/app/resources/resources.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double strokeWidth;

  const ProgressIndicatorWidget({Key? key, this.strokeWidth = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.baseColor,
      strokeWidth: strokeWidth,
    );
  }
}
