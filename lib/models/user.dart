import 'package:easy_mart_app/models/media.dart';

import '../core/utils/constants/network.dart';

class UserModel {
/*
{
  "phone": "+911111111111",
  "first_name": "",
  "last_name": "",
  "profile_photo": "null",
  "profile_photo_url": "null",
  "primary_address": "null",
  "is_verified": true,
  "created_at": "2025-02-07 06:01:54",
  "updated_at": "2025-02-07 06:02:13"
}
*/

  String? phone;
  String? email;
  String? firstName;
  String? lastName;
  MediaModel? profilePhoto;
  String? avatarUrl;
  String? profilePhotoUrl;
  String? primaryAddress;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.phone,
    this.email,
    this.firstName,
    this.lastName,
    this.profilePhoto,
    this.profilePhotoUrl,
    this.primaryAddress,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    profilePhoto = (json['profile_photo'] != null && (json['profile_photo'] is Map))
        ? MediaModel.fromJson(json['profile_photo']) : null;
    profilePhotoUrl = json['profile_photo_url']?.toString();
    avatarUrl = profilePhotoUrl?.isNotEmpty ?? false
        ? "${NetworkConsts.suffixURL}$profilePhotoUrl" : null;
    primaryAddress = json['primary_address']?.toString();
    isVerified = json['is_verified'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_photo'] = profilePhoto;
    data['profile_photo_url'] = profilePhotoUrl;
    data['primary_address'] = primaryAddress;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}