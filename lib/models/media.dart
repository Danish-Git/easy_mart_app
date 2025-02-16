import 'package:easy_mart_app/core/utils/constants/network.dart';

class MediaModel {
/*
{
  "image_id": "67ae2f2477ff2c01445817f3",
  "category": "profile",
  "image_name": "1739468580.png",
  "image_url": "/media/profile/1739468580.png",
  "user_id": "67a5a1d21aaa45695a1249e1",
  "uploaded_at": "2025-02-13 17:43:00"
}
*/

  String? imageId;
  String? category;
  String? imageName;
  String? imageUrl;
  String? finalImageUrl;
  String? userId;
  String? uploadedAt;

  MediaModel({
    this.imageId,
    this.category,
    this.imageName,
    this.imageUrl,
    this.userId,
    this.uploadedAt,
  });

  MediaModel.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id']?.toString();
    category = json['category']?.toString();
    imageName = json['image_name']?.toString();
    imageUrl = json['image_url']?.toString();
    finalImageUrl = "${NetworkConsts.suffixURL}$imageUrl";
    userId = json['user_id']?.toString();
    uploadedAt = json['uploaded_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image_id'] = imageId;
    data['category'] = category;
    data['image_name'] = imageName;
    data['image_url'] = imageUrl;
    data['user_id'] = userId;
    data['uploaded_at'] = uploadedAt;
    return data;
  }
}