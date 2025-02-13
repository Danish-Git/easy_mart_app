import 'dart:convert';

import 'package:easy_mart_app/models/user.dart';
import 'package:easy_mart_app/repositories/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    phoneTextController.text = user.value?.phone ?? "";
    emailTextController.text = user.value?.email ?? "";

    user.refresh();
  }

  void toggleIsEdit() => isEdit.value = !isEdit.value;

  Future<void> selectImage() async {

    if(isEdit.isFalse) toggleIsEdit();

    String? filepath = await UFUImagePicker.show();
    if(filepath?.isNotEmpty ?? false) {
      user.value?.profilePhoto = await UploadRepo().document(filepath: filepath, category: "profile");
    }
  }

}