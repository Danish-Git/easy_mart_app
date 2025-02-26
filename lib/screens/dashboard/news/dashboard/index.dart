import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../home/index.dart';
import '../live_news/index.dart';
import '../post_news/index.dart';
import '../videos/index.dart';
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
          controller: controller.tabController, // Controller for tab navigation
          tabs: controller.getTabs,
          navBarBuilder: (navBarConfig) => Style2BottomNavBar(
            navBarConfig: navBarConfig,
          ),
          gestureNavigationEnabled: true, // Enables swipe gestures for navigation
          stateManagement: true,
        ),
      ),
    );
  }
}
