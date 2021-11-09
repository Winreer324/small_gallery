import 'dart:developer';

import 'package:small_gallery/domain/entity/photo_entity.dart';

class PaginationResponse<T> {
  final int totalItems;
  final int itemsPerPage;
  final int countOfPages;
  final List<T> items;

  PaginationResponse({
    required this.totalItems,
    required this.itemsPerPage,
    required this.countOfPages,
    required this.items,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json, {bool isPerformerWithNestedProfile = false}) {
    return PaginationResponse<T>(
      totalItems: json['totalItems'],
      itemsPerPage: json['itemsPerPage'],
      countOfPages: json['countOfPages'],
      items: PaginationResponse._itemsFromJson<T>(
        json['data'] as List,
      ),
    );
  }

  static _itemsFromJson<T>(List<dynamic> json) {
    try {
      if (T == PhotoEntity) {
        return json.map((item) => PhotoEntity.fromJson(item) as T).toList();
      }
      return [];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
