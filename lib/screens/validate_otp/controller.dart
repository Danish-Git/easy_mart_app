import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../core/routes/pages.dart';
import '../../core/utils/constants/navigation_arguments.dart';
import '../../repositories/auth.dart';

class ValidateOTPScreenController extends GetxController {

  Rx<String?> phoneNo = Rx(Get.arguments[NavigationArgs.phoneNo]);
  String? otpId = Get.arguments[NavigationArgs.otpId];

  @override
  void onInit() {
    super.onInit();
    if(phoneNo.value?.isNotEmpty ?? false) {
      phoneNo.value = "+91-${phoneNo.value}";
    }
  }

  void validateForm() {
  }

  Future<void> validateOtp(String value) async {

    try {
      ShowUFULoader(msg: "Verifying OTP");

      String? phone = phoneNo.value?.replaceAll("-", "");

      Map<String, dynamic> params = {
        "phone_number" : phone?.replaceAll(" ", ""),
        "otp_id" : otpId,
        "otp" : value,
      };

      Map<String, dynamic>? response = await AuthRepo().verifyOTP(params: params);
      if(response != null && response["token"] != null) {
        Get.back();
        Get.offNamedUntil(Routes.newsDashboard, (route) => false);
      }
    } catch (e) {
      Get.back();
      UFUtils.handleError(e);
    }
  }
}