import 'dart:math';

import 'package:domain/domain.dart';
import 'package:elementary/elementary.dart';
import 'package:small_gallery/app/ui/base/base_pagination_model.dart';

class InfinityListModel extends ElementaryModel implements BasePaginationModel<int> {
  final ValueNotifier<bool> _loadingPagination = ValueNotifier(false);
  final List<int> _listData = [];

  @override
  Future<PaginationResponse<int>> fetchData({int page = 1}) async {
    if (page == 1) {
      _listData.addAll(_generateList(page));
      return PaginationResponse(items: _listData);
    } else {
      _loadingPagination.value = true;
      await Future.delayed(const Duration(seconds: 1), () {});
      _listData.addAll(_generateList(page));
      _loadingPagination.value = false;
      return PaginationResponse(items: _listData);
    }
  }

  Iterable<int> _generateList(int page) {
    return Iterable.generate(Random().nextInt(10) + 10, (index) => (page * 100) + index);
  }

  @override
  ValueNotifier<bool> get loadingPagination => _loadingPagination;
}
