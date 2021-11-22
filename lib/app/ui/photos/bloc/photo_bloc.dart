import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:small_gallery/app/resources/resources.dart';
import 'package:small_gallery/domain/entity/pagination_response.dart';
import 'package:small_gallery/domain/entity/photo_entity.dart';
import 'package:small_gallery/domain/enum/type_photo.dart';
import 'package:small_gallery/domain/gateway/photo_gateway.dart';
import 'package:small_gallery/gateway/base/base_dio_request.dart';

part 'photo_event.dart';

part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoGateway photoGateway;
  final TypePhoto typePhoto;

  PhotoBloc({required this.photoGateway, required this.typePhoto}) : super(PhotoInitial());

  bool isPaginationLoading = false;

  int _page = 1;
  int _countOfPages = 1;

  final List<PhotoEntity> _photos = [];

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    final currentState = state;
    if (event is PhotoFetch) {
      yield* _mapPhotoFetch(currentState: currentState);
    }
    if (event is PhotoRefresh) {
      yield* _mapPhotoRefresh(currentState: currentState);
    }
    if (event is PhotoItemClicked) {
      yield* _mapPhotoItemClicked(event: event, currentState: currentState);
    }
  }

  Stream<PhotoState> _mapPhotoFetch({
    required PhotoState currentState,
  }) async* {
    yield* _fetchData(currentState: currentState);
  }

  Stream<PhotoState> _mapPhotoItemClicked({
    required PhotoState currentState,
    required PhotoItemClicked event,
  }) async* {
    yield PhotoItemOpen(photo: event.photo);
    yield PhotoSuccess(photos: _photos);
  }

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

    if (state is PhotoSuccess) {
    } else {}

    if (_photos.isEmpty) {
      yield PhotoLoading();
    } else {
      yield PhotoSuccess(photos: _photos);
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
            _photos.clear();
          }

          _page++;
          _countOfPages = paginationResponse.countOfPages;
          _photos.addAll(paginationResponse.items);
        }
      }
      isPaginationLoading = false;
      yield PhotoSuccess(photos: _photos);
    } on NoInternetConnection catch (_) {
      yield* _setError(isRefresh, saveCurrentPage, loadInternetConnect: true);
    } catch (e) {
      yield* _setError(isRefresh, saveCurrentPage);
    }
  }

  Stream<PhotoState> _setError(bool isRefresh, int saveCurrentPage, {bool loadInternetConnect = false}) async* {
    isPaginationLoading = false;
    if (isRefresh) {
      _page = saveCurrentPage;
    }
    if (_photos.isEmpty) {
      yield PhotoError(loadInternetConnect: loadInternetConnect);
    } else {
      if (!loadInternetConnect) {
        yield PhotoSuccess(photos: _photos);
      } else {
        yield PhotoError(loadInternetConnect: loadInternetConnect);
      }
    }
  }

  void _resetPagination() {
    _page = 1;
    _countOfPages = 1;
  }
}
