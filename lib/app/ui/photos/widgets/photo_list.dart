part of photos;

class PhotoList extends StatelessWidget {
  final List<PhotoEntity> photos;
  final ScrollController scrollController;

  const PhotoList({Key? key, required this.photos, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      controller: scrollController,
      children: List.generate(
        photos.length,
        (index) => Image.network(
          photos[index].imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
