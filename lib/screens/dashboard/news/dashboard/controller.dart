import 'package:easy_mart_app/repositories/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../home/index.dart';
import '../live_news/index.dart';
import '../post_news/index.dart';
import '../videos/index.dart';

class NewsDashboardScreenController extends GetxController {
  late PersistentTabController tabController;

  get getTabs => [
    PersistentTabConfig(
      screen: NewsHomeScreen(key: UniqueKey()),
      item: ItemConfig(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
        activeForegroundColor: AppTheme.themeColors.primary,
        activeColorSecondary: AppTheme.themeColors.lightPrimary,
      ),
    ),
    PersistentTabConfig(
      screen: LiveNewsScreen(key: UniqueKey()),
      item: ItemConfig(
        icon: const Icon(Icons.podcasts_sharp),
        title: "Live News",
        activeForegroundColor: AppTheme.themeColors.primary,
        activeColorSecondary: AppTheme.themeColors.lightPrimary,
      ),
    ),
    PersistentTabConfig(
      screen: PostNewsScreen(key: UniqueKey()),
      item: ItemConfig(
        icon: const Icon(Icons.post_add_outlined),
        title: "Post News",
        activeForegroundColor: AppTheme.themeColors.primary,
        activeColorSecondary: AppTheme.themeColors.lightPrimary,
      ),
    ),
    PersistentTabConfig(
      screen: VideosScreen(key: UniqueKey()),
      item: ItemConfig(
        icon: const Icon(Icons.slow_motion_video_sharp),
        title: "Videos",
        activeForegroundColor: AppTheme.themeColors.primary,
        activeColorSecondary: AppTheme.themeColors.lightPrimary,
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = PersistentTabController(initialIndex: 0);
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
      ShowUFULoader(); // Show loader
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
