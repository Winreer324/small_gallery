part of photos;

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  final double? cacheWidth;
  final double? height;
  final double borderRadiusValue;
  final Function()? onTap;

  const PhotoItem({
    Key? key,
    required this.imageUrl,
    this.onTap,
    this.cacheWidth,
    this.height,
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
          child: imageUrl.contains('.svg')
              ? const Center(child: Text('svg'))
              : Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  cacheWidth: cacheWidth != null ? cacheWidth!.toInt() : 350,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Center(child: Text('loading'));
                    }

                    return child;
                  },
                ),
        ),
      ),
    );
  }
}
