part of photos;

class PhotoItem extends StatelessWidget {
  final PhotoEntity photo;
  final double? cacheWidth;
  final double? height;
  final double? heightLoadingWidget;
  final bool ignoreCacheWidth;
  final double borderRadiusValue;
  final Function()? onTap;

  const PhotoItem({
    Key? key,
    required this.photo,
    this.onTap,
    this.cacheWidth,
    this.height,
    this.heightLoadingWidget,
    this.ignoreCacheWidth = false,
    this.borderRadiusValue = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        child: Container(
          color: Colors.grey,
          child: Image.network(
            photo.imageUrl,
            fit: BoxFit.cover,
            cacheWidth: ignoreCacheWidth
                ? null
                : cacheWidth != null
                    ? cacheWidth!.toInt()
                    : 350,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return _ErrorLoadingWidget(heightLoadingWidget: heightLoadingWidget);
              }

              return child;
            },
            errorBuilder: (context, error, stackTrace) {
              if (photo.imageUrl.contains('.svg')) {
                return Center(
                  child: SvgPicture.network(
                    photo.imageUrl,
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) {
                      return _ErrorLoadingWidget(heightLoadingWidget: heightLoadingWidget);
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _ErrorLoadingWidget extends StatelessWidget {
  final double? heightLoadingWidget;

  const _ErrorLoadingWidget({Key? key, this.heightLoadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightLoadingWidget ?? double.infinity,
      child: const Center(
        child: Text('loading'),
      ),
    );
  }
}
