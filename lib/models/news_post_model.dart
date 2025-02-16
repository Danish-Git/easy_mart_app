import 'package:easy_mart_app/models/media.dart';
import 'package:easy_mart_app/models/user.dart';

class NewsPostModel {
/*
{
  "id": "67b056fc3e60b3d1ea4a51b6",
  "posted_by": "67a5a1d21aaa45695a1249e1",
  "title": "Breaking News: Django API Created",
  "description": "This is a test news description.",
  "cover_image": "null",
  "priority": 1,
  "status": true,
  "is_featured": false,
  "is_trending": true,
  "keywords": [
    "django"
  ],
  "language": "en",
  "category": "null",
  "meta_title": "Django News API",
  "meta_description": "API to create news articles.",
  "created_at": "2025-02-15 08:57:32",
  "uploaded_at": "2025-02-15 08:57:32"
}
*/

  String? id;
  UserModel? postedBy;
  String? title;
  String? description;
  MediaModel? coverImage;
  int? priority;
  bool? status;
  bool? isFeatured;
  bool? isTrending;
  List<String?>? keywords;
  String? language;
  String? category;
  String? metaTitle;
  String? metaDescription;
  String? createdAt;
  String? uploadedAt;

  NewsPostModel({
    this.id,
    this.postedBy,
    this.title,
    this.description,
    this.coverImage,
    this.priority,
    this.status,
    this.isFeatured,
    this.isTrending,
    this.keywords,
    this.language,
    this.category,
    this.metaTitle,
    this.metaDescription,
    this.createdAt,
    this.uploadedAt,
  });

  NewsPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    postedBy = (json['posted_by'] != null && (json['posted_by'] is Map))
        ? UserModel.fromJson(json['posted_by']) : null;
    title = json['title']?.toString();
    description = json['description']?.toString();
    coverImage = (json['cover_image'] != null && (json['cover_image'] is Map))
        ? MediaModel.fromJson(json['cover_image']) : null;
    priority = int.tryParse(json['priority']?.toString() ?? '');
    status = json['status'];
    isFeatured = json['is_featured'];
    isTrending = json['is_trending'];
    if (json['keywords'] != null && (json['keywords'] is List)) {
      keywords = <String>[];
      json['keywords'].forEach((v) {
        keywords?.add(v.toString());
      });
    }
    language = json['language']?.toString();
    category = json['category']?.toString();
    metaTitle = json['meta_title']?.toString();
    metaDescription = json['meta_description']?.toString();
    createdAt = json['created_at']?.toString();
    uploadedAt = json['uploaded_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['posted_by'] = postedBy;
    data['title'] = title;
    data['description'] = description;
    data['cover_image'] = coverImage;
    data['priority'] = priority;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    data['is_trending'] = isTrending;
    if (keywords != null) {
      data['keywords'] = [];
      for (var v in keywords!) {
        data['keywords'].add(v);
      }
    }
    data['language'] = language;
    data['category'] = category;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['created_at'] = createdAt;
    data['uploaded_at'] = uploadedAt;
    return data;
  }
}