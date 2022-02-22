import 'package:flutter/widgets.dart';
export 'package:flutter/widgets.dart';

abstract class BasePaginationWm {
  ScrollController get scrollController;

  Future<void> fetchDataByPagination();

  ValueNotifier<bool> get loadingPagination;
}