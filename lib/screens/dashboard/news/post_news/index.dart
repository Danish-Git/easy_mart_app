import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'controller.dart';

class PostNewsScreen extends StatelessWidget {
  const PostNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostNewsScreenController>(
      global: false,
      init: PostNewsScreenController(),
      builder: (controller) => UFUScaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.themeColors.base,
          centerTitle: true,
          title: const UFUText(
            text: "Post news",
            fontWeight: UFUFontWeight.bold,
            textSize: UFUTextSize.heading2,
          ),
          leading: UFUIconButton(
            onTap: () {},
            icon: Icons.arrow_back_ios,
            iconSize: 20,
            backgroundColor: AppTheme.themeColors.transparent,
            iconColor: AppTheme.themeColors.text,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {},
                child: const UFUAvatar(
                  size: UFUAvatarSize.medium,
                  child: UFUNetworkImage(
                    src: "https://picsum.photos/400",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
