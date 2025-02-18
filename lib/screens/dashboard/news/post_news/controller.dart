import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../core/utils/constants/network.dart';
import '../../../../models/media.dart';
import '../../../../models/news.dart';
import '../../../../models/user.dart';
import '../../../../repositories/news.dart';
import '../../../../repositories/upload.dart';

class PostNewsScreenController extends GetxController {
  Rx<UserModel?> user = Rx(null);

  final GlobalKey<FormState> formKey = GlobalKey();

  UFUInputBoxController titleTextController = UFUInputBoxController();
  UFUInputBoxController descriptionsTextController = UFUInputBoxController();

  RxString newsImage = "".obs;
  MediaModel? postImage;

  bool validateItemForm() => formKey.currentState?.validate() ?? false;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    Map<String, dynamic> json = jsonDecode((await UFUtils.preferences.readString(UFUtils.preferences.userData)) ?? "");
    user.value = UserModel.fromJson(json);
    user.refresh();
  }

  Future<void> selectImage() async {
    String? filepath = await UFUImagePicker.show();
    if(filepath?.isNotEmpty ?? false) {
      dynamic mediaModel = await UploadRepo().document(filepath: filepath, category: "news");
      if(mediaModel is MediaModel) {
        postImage = mediaModel;
        newsImage.value = "${NetworkConsts.suffixURL}${postImage?.imageUrl ?? ""}";
        newsImage.refresh();
      }
    }
    update();
  }

  Future<void> validateForm() async {
    if (validateItemForm()) {
      try {
        ShowUFULoader();
        Map<String, dynamic> params = {
          "title": titleTextController.text.trim(),
          "description": descriptionsTextController.text.trim(),
          "cover_image": postImage?.imageId,
          "language": "en",
          "category": "67a9b1171ac8e33cc84cb298"
        };
        NewsPostModel? response = await NewsRepo().postNews(params: params);
        if(response != null) {
          await ShowUFUConfirmationDialog(
            title: "Post Created",
            subTitle: "Post has been created Successfully, Waiting for approval",
            suffixBtnText: "Ok",
          );
          titleTextController.text = "";
          descriptionsTextController.text = "";
          postImage = null;
          newsImage.value = "";
        }
      } catch (e) {
        UFUtils.handleError(e);
      } finally {
        Get.back();
      }
    } else {
      scrollToErrorField();
    }
  }

  void scrollToErrorField() {
    if(UFUtils.textValidator(titleTextController.text, isRequired: true) != null) {
      titleTextController.scrollAndFocus();
    } else if(UFUtils.textValidator(descriptionsTextController.text, isRequired: true) != null) {
      descriptionsTextController.scrollAndFocus();
    }
  }
}