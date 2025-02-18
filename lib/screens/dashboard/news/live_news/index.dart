import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../core/common_widgets/app_bar.dart';
import '../../../../core/utils/constants/assets.dart';
import 'controller.dart';

class LiveNewsScreen extends StatelessWidget {
  const LiveNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveNewsScreenController>(
      global: false,
      init: LiveNewsScreenController(),
      builder: (controller) => Obx(() => UFUScaffold(
        appBar: EMAppBar(
          title: "Live news",
          user: controller.user.value
        ),
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UFUSvgImage(
                assetPath: AssetsFiles.miniLogo,
                height: 70,
                width: 70,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: UFUText(
                  text: "Coming Soon...",
                  textSize: UFUTextSize.heading4,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
