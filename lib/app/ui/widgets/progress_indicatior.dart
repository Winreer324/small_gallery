import 'package:flutter/material.dart';
import 'package:small_gallery/app/resources/resources.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.baseColor,
      strokeWidth: 5,
    );
  }
}
