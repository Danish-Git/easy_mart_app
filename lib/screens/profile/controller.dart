import 'dart:convert';

import 'package:easy_mart_app/models/media.dart';
import 'package:easy_mart_app/models/user.dart';
import 'package:easy_mart_app/repositories/upload.dart';
import 'package:easy_mart_app/repositories/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class ProfileScreenController extends GetxController {
  RxString profileImage = "".obs;
  RxBool isEdit = false.obs;
  Rx<UserModel?> user = Rx(null);

  final GlobalKey<FormState> formKey = GlobalKey();

  UFUInputBoxController firstNameTextController = UFUInputBoxController();
  UFUInputBoxController lastNameTextController = UFUInputBoxController();
  UFUInputBoxController phoneTextController = UFUInputBoxController();
  UFUInputBoxController emailTextController = UFUInputBoxController();

  bool validateItemForm() => formKey.currentState?.validate() ?? false;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    Map<String, dynamic> json = jsonDecode((await UFUtils.preferences.readString(UFUtils.preferences.userData)) ?? "");
    user.value = UserModel.fromJson(json);

    firstNameTextController.text = user.value?.firstName ?? "";
    lastNameTextController.text = user.value?.lastName ?? "";
    phoneTextController.text = user.value?.phone?.substring(3) ?? "";
    emailTextController.text = user.value?.email ?? "";
    profileImage.value = user.value?.avatarUrl ?? "";

    user.refresh();
    profileImage.refresh();
  }

  void toggleIsEdit() => isEdit.value = !isEdit.value;

  Future<void> selectImage() async {

    if(isEdit.isFalse) toggleIsEdit();

    String? filepath = await UFUImagePicker.show();
    if(filepath?.isNotEmpty ?? false) {
      dynamic mediaModel = await UploadRepo().document(filepath: filepath, category: "profile");
      if(mediaModel is MediaModel) {
        user.value?.profilePhoto = mediaModel;
        user.value?.profilePhotoUrl = mediaModel.imageUrl;
        user.value?.avatarUrl = mediaModel.imageUrl?.isNotEmpty ?? false
            ? mediaModel.imageUrl : null;
        profileImage.value = user.value?.avatarUrl ?? "";
      }
    }
    user.refresh();
  }

  Future<void> validateForm() async {
    if (validateItemForm()) {
      try {
        ShowUFULoader(msg: "Updating Profile");
        Map<String, dynamic> params = {
          "first_name": firstNameTextController.text.trim(),
          "last_name":lastNameTextController.text.trim(),
          "profile_photo": user.value?.profilePhoto,
          "profile_photo_url": user.value?.profilePhotoUrl,
          "primary_address": "67a49750b3669e4f6620ce2e",
        };

        Map<String, dynamic>? response = await UserRepo().updateProfile(params: params);
        if(response != null ) {
          user.value?.firstName = firstNameTextController.text.trim();
          user.value?.lastName = lastNameTextController.text.trim();
          user.value?.profilePhoto = user.value?.profilePhoto;
          user.value?.profilePhotoUrl = user.value?.profilePhotoUrl;
          user.value?.avatarUrl = user.value?.avatarUrl;
          user.value?.primaryAddress = firstNameTextController.text.trim();
          profileImage.value = user.value?.avatarUrl ?? "";
        }
        toggleIsEdit();
        Get.back();
      } catch (e) {
        Get.back();
        UFUtils.handleError(e);
      }

    } else {
      scrollToErrorField();
    }
  }

  void scrollToErrorField() {
    if(UFUtils.textValidator(firstNameTextController.text, isRequired: true) != null) {
      firstNameTextController.scrollAndFocus();
    } else if(UFUtils.textValidator(lastNameTextController.text, isRequired: false) != null) {
      lastNameTextController.scrollAndFocus();
    } else if(UFUtils.phoneValidator(phoneTextController.text) != null) {
      phoneTextController.scrollAndFocus();
    } else if(UFUtils.emailValidator(emailTextController.text, isRequired: false) != null) {
      emailTextController.scrollAndFocus();
    }
  }

}