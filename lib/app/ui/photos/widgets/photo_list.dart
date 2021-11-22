part of photos;

class PhotoList extends StatelessWidget {
  final List<PhotoEntity> photos;
  final ScrollController scrollController;
  final ScrollPhysics physics;

  const PhotoList({
    Key? key,
    required this.photos,
    required this.scrollController,
    this.physics = const AlwaysScrollableScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: scrollController,
      physics: physics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 9,
        crossAxisSpacing: 9,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        final String imageUrl = photos[index].imageUrl;
        return Hero(
          tag: imageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.grey,
              child: PhotoItem(
                imageUrl: imageUrl,
                onTap: () {
                  context.read<PhotoBloc>().add(PhotoItemClicked(photo: photos[index]));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
