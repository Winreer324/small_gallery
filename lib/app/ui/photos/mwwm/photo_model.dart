import 'package:domain/domain.dart';
import 'package:elementary/elementary.dart';
import 'package:small_gallery/app/ui/base/base_pagination_model.dart';

class PhotoModel extends ElementaryModel implements BasePaginationModel<PhotoEntity> {
  final ValueNotifier<bool> _loadingPagination = ValueNotifier(false);
  final List<PhotoEntity> _listData = [];
  final PhotoGateway photoGateway;

  PhotoModel({required this.photoGateway});

  @override
  Future<PaginationResponse<PhotoEntity>> fetchData({int page = 1}) async {
    if (page == 1) {
      return PaginationResponse(items: _listData);
    } else {
      _loadingPagination.value = true;
      await Future.delayed(const Duration(seconds: 1), () {});

      _loadingPagination.value = false;
      return PaginationResponse(items: _listData);
    }
  }

  @override
  ValueNotifier<bool> get loadingPagination => _loadingPagination;
}
