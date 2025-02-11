import 'package:easy_mart_app/core/utils/constants/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../core/routes/pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    initApp();
  }

  void initApp() {
    UFUtils.appName = "Easy Mart";
    UFUtils.baseUrl = NetworkConsts.baseURL;
    AppTheme.themeColors.primary = const Color(0xFF8800EB);
    AppTheme.themeColors.lightPrimary = const Color(0xFFF4F1FD);
    AppTheme.themeColors.secondary = const Color(0xFFEF151A);
    AppTheme.themeColors.secondaryLight = const Color(0xEFFFDBDB).withAlpha(70);
    AppTheme.themeColors.brown = const Color(0xFF570101);
    AppTheme.themeColors.yellow = const Color(0xFFFCC45E);
    Future.delayed(const Duration(seconds: 4), () async {
      if(await UFUtils.preferences.readIsUserLoggedIn()) {
        Get.offNamedUntil(Routes.newsDashboard, (route) => false);
      } else {
        Get.offNamedUntil(Routes.login, (route) => false);
      }
    });
  }
}