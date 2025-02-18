import 'dart:convert';

import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../models/user.dart';

class LiveNewsScreenController extends GetxController {
  Rx<UserModel?> user = Rx(null);

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
}