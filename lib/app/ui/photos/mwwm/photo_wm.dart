import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:gateway/gateway.dart';
import 'package:small_gallery/app/di/injection.dart';
import 'package:small_gallery/app/ui/base/base_pagination_wm.dart';
import 'package:small_gallery/app/ui/helpers/context_helper.dart';
import 'package:small_gallery/app/ui/photos/mwwm/photo_model.dart';
import 'package:small_gallery/app/ui/photos/photo_screen_wm.dart';

class PhotoScreenWM extends WidgetModel<PhotoScreenWmWidget, PhotoModel> implements IPhotoWm {
  final EntityStateNotifier<List<PhotoEntity>?> _currentPhotoList = EntityStateNotifier(null);

  final ScrollController _scrollController = ScrollController();
  final ContextHelper _contextHelper;
  final TypePhoto _typePhoto;

  // final PhotoGateway photoGateway;

  PhotoScreenWM(this._contextHelper, this._typePhoto, PhotoModel model) : super(model);

  int _pagePagination = 1;
  int _countOfPages = 1;

  @override
  ValueNotifier<bool> get loadingPagination => model.loadingPagination;

  @override
  ListenableState<EntityState<List<PhotoEntity>?>> get currentPhotoList => _currentPhotoList;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initData();
  }

  Future<void> _initData() async {
    _currentPhotoList.loading();
    final response = await model.fetchData(page: _pagePagination);
    _currentPhotoList.content(response.items);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Future<void> fetchDataByPagination() async {
    if (model.loadingPagination.value) {
      return;
    }
    _pagePagination++;
    final response = await model.fetchData(page: _pagePagination);
    _currentPhotoList.content(response.items);
  }

  @override
  TypePhoto get typePhoto => _typePhoto;

  @override
  Size get sizeScreen => _contextHelper.getSizeScreen(context);

  @override
  ThemeData get theme => _contextHelper.getTheme(context);
}

PhotoScreenWM createNewPhotoScreenWM(BuildContext _) => PhotoScreenWM(
      ContextHelper(),
      TypePhoto.newPhoto,
      PhotoModel(photoGateway: injection()),
    );

PhotoScreenWM createPopularPhotoScreenWM(BuildContext _) => PhotoScreenWM(
      ContextHelper(),
      TypePhoto.popularPhoto,
      PhotoModel(photoGateway: injection()),
    );

abstract class IPhotoWm extends IWidgetModel implements BasePaginationWm {
  ListenableState<EntityState<List<PhotoEntity>?>> get currentPhotoList;

  TypePhoto get typePhoto;

  Size get sizeScreen;

  ThemeData get theme;
}
