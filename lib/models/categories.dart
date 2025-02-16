class CategoriesModel {
/*
{
  "id": "67a9b1171ac8e33cc84cb298",
  "title": "Featured",
  "slug": "Fe",
  "description": "",
  "icon_url": "",
  "priority": 1,
  "is_featured": false,
  "is_trending": false,
  "keywords": [
    ""
  ],
  "meta_title": "null",
  "meta_description": "null",
  "created_at": "2025-02-10T07:56:07.222000",
  "updated_at": "2025-02-10T13:14:12.360000"
}
*/

  String? id;
  String? title;
  String? slug;
  String? description;
  String? iconUrl;
  int? priority;
  bool? isFeatured;
  bool? isTrending;
  List<String?>? keywords;
  String? metaTitle;
  String? metaDescription;
  String? createdAt;
  String? updatedAt;

  CategoriesModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.iconUrl,
    this.priority,
    this.isFeatured,
    this.isTrending,
    this.keywords,
    this.metaTitle,
    this.metaDescription,
    this.createdAt,
    this.updatedAt,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    slug = json['slug']?.toString();
    description = json['description']?.toString();
    iconUrl = json['icon_url']?.toString();
    priority = int.tryParse(json['priority']?.toString() ?? '');
    isFeatured = json['is_featured'];
    isTrending = json['is_trending'];
    if (json['keywords'] != null && (json['keywords'] is List)) {
      keywords = <String>[];
      json['keywords'].forEach((v) {
        keywords?.add(v.toString());
      });
    }
    metaTitle = json['meta_title']?.toString();
    metaDescription = json['meta_description']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['icon_url'] = iconUrl;
    data['priority'] = priority;
    data['is_featured'] = isFeatured;
    data['is_trending'] = isTrending;
    if (keywords != null) {
      data['keywords'] = [];
      for (var v in keywords!) {
        data['keywords'].add(v);
      }
    }
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}