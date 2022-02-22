import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/extensions/context_extensions.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'package:small_gallery/app/ui/details_photo/details_photo.dart';
import 'package:small_gallery/app/ui/photos/bloc/photo_bloc.dart';
import 'package:small_gallery/app/ui/photos/mwwm/photo_wm.dart';
import 'package:small_gallery/app/ui/photos/photo_imports.dart';
import 'package:small_gallery/app/ui/widgets/animation_loader.dart';
import 'package:small_gallery/app/ui/widgets/pagination_widget.dart';
import 'package:small_gallery/app/ui/widgets/placeholder_lost_internet_connect.dart';
import 'package:small_gallery/app/ui/widgets/progress_indicator.dart';
import 'package:small_gallery/app/ui/widgets/refresh_widget/cubit/refresh_cubit.dart';
import 'package:small_gallery/app/ui/widgets/refresh_widget/widgets/refresh_widget.dart';

class PhotoScreenWmWidget extends ElementaryWidget<IPhotoWm> {
  const PhotoScreenWmWidget({
    Key? key,
    required WidgetModelFactory<PhotoScreenWM> createWM,
  }) : super(createWM, key: key);

  @override
  Widget build(IPhotoWm wm) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            GatewayConstants.alice.showInspector();
          },
          child: Text(
            wm.typePhoto.typePhotoByString,
            style: AppTextStyles.titleAppBar.copyWith(
              color: wm.theme.backIconAppBar,
            ),
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
          orElse: () => null,
        ),
        child: SizedBox(
          height: wm.sizeScreen.height,
          child: Stack(
            children: [
              RefreshWidget(
                callRefresh: () {
                  // context.read<PhotoBloc>().add(const PhotoEvent.refresh());
                  // context.read<RefreshCubit>().callRefresh();
                },
                scrollController: wm.scrollController,
                child: SafeArea(
                  child: SizedBox(
                    width: wm.sizeScreen.width,
                    height: wm.sizeScreen.height,
                    child: BlocBuilder<PhotoBloc, PhotoState>(
                      builder: (context, state) => state.maybeWhen(
                        loading: () => const Center(child: ProgressIndicatorWidget()),
                        success: (photos, isPaginationLoading, _) => PaginationWidget(
                          scrollController: wm.scrollController,
                          callbackPagination: () {
                            if (!isPaginationLoading) {
                              context.read<PhotoBloc>().add(const PhotoEvent.fetch());
                            }
                          },
                          child: PhotoList(
                            photos: photos,
                            scrollController: wm.scrollController,
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
