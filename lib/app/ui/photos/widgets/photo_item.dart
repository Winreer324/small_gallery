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
                return SizedBox(
                  height: heightLoadingWidget ?? double.infinity,
                  child: const Center(
                    child: Text('loading'),
                  ),
                );
              }

              return child;
            },
            errorBuilder: (context, error, stackTrace) {
              if (photo.imageUrl.contains('.svg')) {
                return const Center(child: Text('svg'));
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
