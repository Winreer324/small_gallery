import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';
import 'photo_event.dart';
import 'photo_state.dart';

export 'photo_event.dart';
export 'photo_state.dart';

/// bloc v7.3.3
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoGateway photoGateway;
  final TypePhoto typePhoto;

  PhotoBloc({required this.photoGateway, required this.typePhoto}) : super(const PhotoState.loading());

  int _page = 1;
  int _countOfPages = 1;

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    final currentState = state;
    yield* event.when(
      fetch: () => _mapPhotoFetch(currentState: currentState),
      refresh: () => _mapPhotoRefresh(currentState: currentState),
      itemClicked: (photo) => _mapPhotoItemClicked(currentState: currentState, photo: photo),
    );
  }

  Stream<PhotoState> _mapPhotoFetch({
    required PhotoState currentState,
  }) async* {
    yield* _fetchData(currentState: currentState);
  }

  Stream<PhotoState> _mapPhotoItemClicked({
    required PhotoState currentState,
    required PhotoEntity photo,
  }) async* {
    yield PhotoState.itemOpen(photo: photo);
    if (currentState is PhotoSuccess) {
      yield currentState.copyWith(
        photos: currentState.photos,
      );
    }
  }

  List<PhotoEntity> _getPhotosInState(PhotoState currentState) =>
      currentState is PhotoSuccess ? currentState.photos : [];

  Stream<PhotoState> _mapPhotoRefresh({
    required PhotoState currentState,
  }) async* {
    yield* _fetchData(currentState: currentState, isRefresh: true);
  }

  Stream<PhotoState> _fetchData({required PhotoState currentState, bool isRefresh = false}) async* {
    int saveCurrentPage = _page;
    if (isRefresh) {
      _resetPagination();
    }

    List<PhotoEntity> photos = _getPhotosInState(currentState);

    if (photos.isEmpty) {
      yield const PhotoState.loading();
    } else {
      if (currentState is PhotoSuccess) {
        yield currentState.copyWith(
          photos: photos,
          isPaginationLoading: true,
          isRefresh: isRefresh,
        );
      }
    }

    try {
      if (_page <= _countOfPages) {
        final PaginationResponse<PhotoEntity> paginationResponse = await photoGateway.fetchPhoto(
          page: _page,
          limit: AppConst.limitItems,
          typePhoto: typePhoto,
        );

        if (paginationResponse.items.isNotEmpty) {
          if (isRefresh) {
            photos.clear();
          }

          _page++;
          _countOfPages = paginationResponse.countOfPages;
          photos.addAll(paginationResponse.items);
        }
      }

      if (currentState is PhotoSuccess) {
        yield currentState.copyWith(
          photos: photos,
          isPaginationLoading: false,
          isRefresh: false,
        );
      } else {
        yield PhotoState.success(photos: photos, isPaginationLoading: false, isRefresh: false);
      }
    } on NoInternetConnection catch (_) {
      yield* _setError(currentState, isRefresh, saveCurrentPage, loadInternetConnect: true);
    } catch (_) {
      yield* _setError(currentState, isRefresh, saveCurrentPage);
    }
  }

  Stream<PhotoState> _setError(PhotoState currentState, bool isRefresh, int saveCurrentPage,
      {bool loadInternetConnect = false}) async* {
    if (isRefresh) {
      _page = saveCurrentPage;
    }

    List<PhotoEntity> photos = _getPhotosInState(currentState);

    if (photos.isEmpty) {
      yield PhotoState.error(loadInternetConnect: loadInternetConnect);
    } else {
      if (!loadInternetConnect) {
        yield PhotoState.success(photos: photos, isPaginationLoading: false, isRefresh: false);
      } else {
        if (photos.isEmpty) {
          yield PhotoState.error(loadInternetConnect: loadInternetConnect);
        } else {
          yield PhotoState.success(photos: photos, isPaginationLoading: false, isRefresh: false);
        }
      }
    }
  }

  void _resetPagination() {
    _page = 1;
    _countOfPages = 1;
  }
}
