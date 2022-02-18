import 'dart:math';

import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

class InfinityListModel extends ElementaryModel implements BasePaginationModel<int> {
  final ValueNotifier<bool> _loadingPagination = ValueNotifier(false);
  final List<int> _listData = [];

  @override
  Future<List<int>> fetchData({int page = 1}) async {
    if (page == 1) {
      _listData.addAll(_generateList(page));
      return _listData;
    } else {
      _loadingPagination.value = true;
      await Future.delayed(const Duration(seconds: 1), () {});
      _listData.addAll(_generateList(page));
      _loadingPagination.value = false;
      return _listData;
    }
  }

  Iterable<int> _generateList(int page) {
    return Iterable.generate(Random().nextInt(5) + 10, (index) => (page * 100) + index);
  }

  @override
  ValueNotifier<bool> get loadingPagination => _loadingPagination;
}

abstract class BasePaginationModel<T> {
  final ValueNotifier<bool> loadingPagination = ValueNotifier(false);

  Future<List<T>> fetchData({int page = 1});
}
