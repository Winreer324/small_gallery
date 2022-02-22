part of domain;

class PaginationResponse<T> {
  final int totalItems;
  final int itemsPerPage;
  final int countOfPages;
  final List<T> items;

  PaginationResponse({
    this.totalItems = 0,
    this.itemsPerPage = 0,
    this.countOfPages = 0,
    this.items = const [],
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) {
    return PaginationResponse<T>(
      totalItems: json['totalItems'] != null ? int.tryParse(json['totalItems'].toString()) ?? 0 : 0,
      itemsPerPage: json['itemsPerPage'] != null ? int.tryParse(json['itemsPerPage'].toString()) ?? 0 : 0,
      countOfPages: json['countOfPages'] != null ? int.tryParse(json['countOfPages'].toString()) ?? 0 : 0,
      items: json['data'] != null
          ? PaginationResponse._itemsFromJson<T>(
              (json['data'] as List).cast<Map<String, dynamic>>(),
            )
          : [],
    );
  }

  static List<T> _itemsFromJson<T>(List<Map<String, dynamic>> json) {
    try {
      if (T == PhotoEntity) {
        return json.map((item) => PhotoEntity.fromJson(item)).cast<T>().toList();
      }
      return [];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
