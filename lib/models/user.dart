class User {
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
  String? firstName;
  String? lastName;
  String? profilePhoto;
  String? profilePhotoUrl;
  String? primaryAddress;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  User({
    this.phone,
    this.firstName,
    this.lastName,
    this.profilePhoto,
    this.profilePhotoUrl,
    this.primaryAddress,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    profilePhoto = json['profile_photo']?.toString();
    profilePhotoUrl = json['profile_photo_url']?.toString();
    primaryAddress = json['primary_address']?.toString();
    isVerified = json['is_verified'];
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
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