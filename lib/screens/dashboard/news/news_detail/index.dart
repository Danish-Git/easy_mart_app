import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../core/utils/constants/assets.dart';
import 'controller.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDetailController>(
      global: false,
      init: NewsDetailController(),
      builder: (controller) => UFUScaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              centerTitle: false,

              backgroundColor: AppTheme.themeColors.transparent,
              leading: UFUIconButton(
                onTap: () => Get.back(),
                icon: Icons.arrow_back_ios,
                iconSize: 20,
                backgroundColor: AppTheme.themeColors.transparent,
                iconColor: AppTheme.themeColors.base,
              ),
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: UFUNetworkImage(
                      src: controller.news?.coverImage?.finalImageUrl ?? "",
                      boxFit: BoxFit.cover,
                      borderRadius: 30,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 20, 15),
                        child: Row(
                          children: [
                            UFUButton(
                              text: controller.news?.category?.title ?? "",
                              size: UFUButtonSize.extraSmall,
                              colorType: UFUButtonColorType.secondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UFUText(
                  text: controller.news?.title ?? "",
                  textAlign: TextAlign.start,
                  textSize: UFUTextSize.heading2,
                  fontWeight: UFUFontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const UFUSvgImage(
                        assetPath: AssetsFiles.miniLogo,
                        height: 30,
                        width: 30,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: UFUText(
                            text: UFUtils.formatDate(controller.news?.createdAt ?? DateTime.now(), format: "MMMM dd, yyyy") ?? "",
                            textSize: UFUTextSize.heading4,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: UFUText(
                    text: controller.news?.description ?? "",
                    textAlign: TextAlign.start,
                    textSize: UFUTextSize.heading4,
                  ),
                ),
                SafeArea(top: false, child: Container())
              ],
            ),
          )
        )
      ),
    );
  }
}
