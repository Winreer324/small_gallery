part of photos;

class PhotoScreen extends StatefulWidget {
  final TypePhoto typePhoto;

  const PhotoScreen({
    Key? key,
    required this.typePhoto,
  }) : super(key: key);

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.typePhoto.typePhotoByString,
          style: AppTextStyles.titleAppBar,
        ),
        elevation: 0,
      ),
      body: SizedBox(
        height: context.sizeScreen.height,
        child: Stack(
          children: [
            PaginationWidget(
              scrollController: scrollController,
              child: SafeArea(
                child: SizedBox(
                  width: context.sizeScreen.width,
                  height: context.sizeScreen.height,
                  child: BlocBuilder<PhotoBloc, PhotoState>(
                    builder: (context, state) {
                      if (state is PhotoLoading) {
                        return const Center(child: ProgressIndicatorWidget());
                      }

                      if (state is PhotoSuccess) {
                        return PhotoList(photos: state.photos, scrollController: scrollController);
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<PhotoBloc, PhotoState>(
                builder: (context, state) {
                  if (context.read<PhotoBloc>().isPaginationLoading) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: ProgressIndicatorWidget(),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
