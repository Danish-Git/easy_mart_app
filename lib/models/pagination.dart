class PaginationModel {
/*
{
  "current_page": 1,
  "page_size": 10,
  "total_items": 18,
  "total_pages": 2
}
*/

  int? currentPage;
  int? pageSize;
  int? totalItems;
  int? totalPages;

  PaginationModel({
    this.currentPage = 1,
    this.pageSize = 10,
    this.totalItems,
    this.totalPages,
  });

  PaginationModel.fromJson(Map<String, dynamic> json) {
    currentPage = int.tryParse(json['current_page']?.toString() ?? '');
    pageSize = int.tryParse(json['page_size']?.toString() ?? '');
    totalItems = int.tryParse(json['total_items']?.toString() ?? '');
    totalPages = int.tryParse(json['total_pages']?.toString() ?? '');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['page_size'] = pageSize;
    data['total_items'] = totalItems;
    data['total_pages'] = totalPages;
    return data;
  }
}

