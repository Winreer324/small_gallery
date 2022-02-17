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
        title: GestureDetector(
          onTap: () {
            GatewayConstants.alice.showInspector();
          },
          child: Text(
            widget.typePhoto.typePhotoByString,
            style: AppTextStyles.titleAppBar,
          ),
        ),
        elevation: 0,
      ),
      body: BlocListener<PhotoBloc, PhotoState>(
        listener: (context, state) => state.maybeWhen(
          itemOpen: (photo) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).push<void>(MaterialPageRoute(builder: (context) => DetailsPhoto(photo: photo)));
          },
          success: (_, __, ___) {
            context.read<RefreshCubit>().doneUpdate();
          },
          error: (_, __, ___) {
            context.read<RefreshCubit>().doneUpdate();
          },
          orElse: () {},
        ),
        child: SizedBox(
          height: context.sizeScreen.height,
          child: Stack(
            children: [
              RefreshWidget(
                callRefresh: () {
                  context.read<PhotoBloc>().add(const PhotoEvent.refresh());
                  context.read<RefreshCubit>().callRefresh();
                },
                scrollController: scrollController,
                child: SafeArea(
                  child: SizedBox(
                    width: context.sizeScreen.width,
                    height: context.sizeScreen.height,
                    child: BlocBuilder<PhotoBloc, PhotoState>(
                      builder: (context, state) => state.maybeWhen(
                        loading: () => const Center(child: ProgressIndicatorWidget()),
                        success: (photos, isPaginationLoading, _) => PaginationWidget(
                          scrollController: scrollController,
                          callbackPagination: () {
                            if (!isPaginationLoading) {
                              context.read<PhotoBloc>().add(const PhotoEvent.fetch());
                            }
                          },
                          child: PhotoList(
                            photos: photos,
                            scrollController: scrollController,
                          ),
                        ),
                        error: (_, __, loadInternetConnect) => loadInternetConnect
                            ? Padding(
                                padding: EdgeInsets.only(top: context.sizeScreen.height * .2),
                                child: const SingleChildScrollView(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: PlaceholderLostInternetConnect(),
                                ),
                              )
                            : const SizedBox(),
                        orElse: () => const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<PhotoBloc, PhotoState>(
                  builder: (context, state) => state.maybeWhen(
                    orElse: () => const SizedBox(),
                    success: (_, isPaginationLoading, isRefresh) => isPaginationLoading && !isRefresh
                        ? const Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: AnimationLoader(),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
