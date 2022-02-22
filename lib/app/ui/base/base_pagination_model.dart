import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
export 'package:flutter/foundation.dart';

abstract class BasePaginationModel<T> {
  final ValueNotifier<bool> loadingPagination = ValueNotifier(false);

  Future<PaginationResponse<T>> fetchData({int page = 1});
}
