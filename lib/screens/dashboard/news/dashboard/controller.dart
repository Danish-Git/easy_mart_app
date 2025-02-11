import 'package:easy_mart_app/repositories/user.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class NewsDashboardScreenController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    Future.wait(<Future<dynamic>> [
      Future.delayed(const Duration(milliseconds: 150), () => ShowUFULoader()),
      fetchUserProfile()
    ]).whenComplete(() => Get.back());
  }

  Future<void> fetchUserProfile() async {
    try {
      Map<String, dynamic>? response = await UserRepo().getUserProfile();
      if(response != null) {
        // Get.back();
        // Get.offNamedUntil(Routes.newsDashboard, (route) => false);
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
  }
  

}
