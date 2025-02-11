import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../core/utils/constants/assets.dart';
import 'controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      global: false,
      init: SplashController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppTheme.themeColors.base,
        body: const Center(
          child: UFUSvgImage(assetPath: AssetsFiles.logo, width: 250),
        ),
      ),
    );
  }
}
