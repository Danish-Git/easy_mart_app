import 'package:easy_mart_app/core/routes/pages.dart';
import 'package:easy_mart_app/core/utils/constants/navigation_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../repositories/auth.dart';

class LoginScreenController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  UFUInputBoxController phoneTextController = UFUInputBoxController();

  bool validateItemForm() => loginFormKey.currentState?.validate() ?? false;

  Future<void> validateForm() async {
    if(validateItemForm()) {

      try {
        ShowUFULoader(msg: "Sending OTP");
        Map<String, dynamic> params = {
          "phone_number": "+91${phoneTextController.text.trim().replaceAll(' ', '')}"
        };

        Map<String, dynamic>? response = await AuthRepo().sendOTP(params: params);
        if(response != null && response["otp_id"] != null) {
          Get.back();
          Get.toNamed(Routes.validateOtp, arguments: {
            NavigationArgs.phoneNo: phoneTextController.text.trim(),
            NavigationArgs.otpId: response["otp_id"],
          });
        }
      } catch (e) {
        Get.back();
        UFUtils.handleError(e);
      }
    } else {
      scrollToErrorField();
    }
  }

  void scrollToErrorField() {
    if(UFUtils.phoneValidator(phoneTextController.text) != null) {
      phoneTextController.scrollAndFocus();
    }
  }
}