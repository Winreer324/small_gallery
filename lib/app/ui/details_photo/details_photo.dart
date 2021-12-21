import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'package:small_gallery/app/ui/photos/photo_imports.dart';

class DetailsPhoto extends StatelessWidget {
  final PhotoEntity photo;

  const DetailsPhoto({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              AppIcons.backIconSvg,
              color: AppColors.subBaseColor,
              width: 24,
              height: 24,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 3,
              child: SizedBox(
                width: context.sizeScreen.width,
                child: PhotoItem(
                  photo: photo,
                  cacheWidth: context.sizeScreen.width,
                  borderRadiusValue: 0,
                  heightLoadingWidget: 350,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.name,
                    style: AppTextStyles.textMajorSubColor,
                  ),
                  if (photo.description != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        photo.description!,
                        style: AppTextStyles.lightBlackText,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
