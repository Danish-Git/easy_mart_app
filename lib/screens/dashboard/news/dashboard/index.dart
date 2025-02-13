import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../home/index.dart';
import '../live_news/index.dart';
import '../post_news/index.dart';
import 'controller.dart';

class NewsDashboardScreen extends StatelessWidget {
  const NewsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDashboardScreenController>(
      global: false,
      init: NewsDashboardScreenController(),
      builder: (controller) => UFUScaffold(
        body: PersistentTabView(
          tabs: [
            PersistentTabConfig(
              screen: const NewsHomeScreen(),
              item: ItemConfig(
                icon: const Icon(Icons.home_outlined),
                title: "Home",
                activeForegroundColor: AppTheme.themeColors.primary,
                activeColorSecondary: AppTheme.themeColors.lightPrimary,
              ),
            ),
            PersistentTabConfig(
              screen: const LiveNewsScreen(),
              item: ItemConfig(
                icon: const Icon(Icons.podcasts_sharp),
                title: "Live News",
                activeForegroundColor: AppTheme.themeColors.primary,
                activeColorSecondary: AppTheme.themeColors.lightPrimary,
              ),
            ),
            PersistentTabConfig(
              screen: const PostNewsScreen(),
              item: ItemConfig(
                icon: const Icon(Icons.post_add_outlined),
                title: "Post News",
                activeForegroundColor: AppTheme.themeColors.primary,
                activeColorSecondary: AppTheme.themeColors.lightPrimary,
              ),
            ),
            PersistentTabConfig(
              screen: const UFUText(text: "Videos"),
              item: ItemConfig(
                icon: const Icon(Icons.slow_motion_video_sharp),
                title: "Videos",
                activeForegroundColor: AppTheme.themeColors.primary,
                activeColorSecondary: AppTheme.themeColors.lightPrimary,
              ),
            ),
          ],
          // backgroundColor: AppTheme.themeColors.base,

          navBarBuilder: (navBarConfig) => Style2BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}
