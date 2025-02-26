import 'package:easy_mart_app/models/media.dart';

class VideosModel {
/*
{
  "id": "67b626e3a2cbfb13b0a00a59",
  "title": "Sample Video",
  "description": "This is a sample video description",
  "cover_image": {
    "image_id": "67b192c648003e4a4bb78162",
    "category": "news",
    "image_name": "1739690694.jpg",
    "image_url": "/media/news/1739690694.jpg"
  },
  "video_url": "https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4",
  "status": true,
  "is_trending": true,
  "keywords": [
    "String"
  ],
  "meta_title": "Sample Video Meta Title",
  "meta_description": "This is a sample meta description for the video",
  "created_at": "2025-02-19 18:45:55",
  "updated_at": "2025-02-19 18:45:55"
}
*/

  String? id;
  String? title;
  String? description;
  MediaModel? coverImage;
  String? videoUrl;
  bool? status;
  bool? isTrending;
  List<String?>? keywords;
  String? metaTitle;
  String? metaDescription;
  String? createdAt;
  String? updatedAt;

  VideosModel({
    this.id,
    this.title,
    this.description,
    this.coverImage,
    this.videoUrl,
    this.status,
    this.isTrending,
    this.keywords,
    this.metaTitle,
    this.metaDescription,
    this.createdAt,
    this.updatedAt,
  });
  VideosModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    description = json['description']?.toString();
    coverImage = (json['cover_image'] != null && (json['cover_image'] is Map)) ? MediaModel.fromJson(json['cover_image']) : null;
    videoUrl = json['video_url']?.toString();
    status = json['status'];
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
    data['description'] = description;
    if (coverImage != null) {
      data['cover_image'] = coverImage!.toJson();
    }
    data['video_url'] = videoUrl;
    data['status'] = status;
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

