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

  // {
  //   on<PhotoEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }

  bool isPaginationLoading = false;

  int _page = 1;
  int _countOfPages = 1;

  List<PhotoEntity> _photos = [];

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is PhotoFetch) {
      yield* _mapPhotoFetch();
    }
    if (event is PhotoRefresh) {
      yield* _mapPhotoRefresh();
    }
  }

  Stream<PhotoState> _mapPhotoFetch() async* {
    yield* _fetchData();
  }

  Stream<PhotoState> _mapPhotoRefresh() async* {
    yield* _fetchData(isRefresh: true);
  }

  Stream<PhotoState> _fetchData({bool isRefresh = false}) async* {
    if (isRefresh) {
      _resetPagination();
    }

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
        isPaginationLoading = false;
        yield PhotoSuccess(photos: _photos);
      }
    } on NoInternetConnection catch (_) {
      yield PhotoError();
    } catch (e) {
      if (_photos.isEmpty) {
        yield PhotoError();
      } else {
        yield PhotoSuccess(photos: _photos);
      }
    }
  }

  void _resetPagination() {
    _page = 1;
    _countOfPages = 1;
  }
}
