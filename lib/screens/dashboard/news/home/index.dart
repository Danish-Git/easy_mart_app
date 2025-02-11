import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'controller.dart';
import 'widgets/news_home_listing/index.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsHomeScreenController>(
      global: false,
      init: NewsHomeScreenController(),
      builder: (controller) => UFUScaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.themeColors.base,
          centerTitle: true,
          title: const UFUText(
            text: "News",
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
              child: UFUIconButton(
                onTap: () {},
                icon: Icons.translate_outlined,
                backgroundColor: AppTheme.themeColors.transparent,
                iconSize: 24,
                iconColor: AppTheme.themeColors.text,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 45,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.filters.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 10,),
                  itemBuilder: (context, index) => UFUButton(
                    onPressed: () => controller.updateSelectedFilter(index),
                    text: controller.filters[index]["label"],
                    size: UFUButtonSize.mediumWithIcon,
                    textSize: UFUTextSize.heading4,
                    fontWeight: UFUFontWeight.medium,
                    colorType: controller.selectedFilter?["id"] == controller.filters[index]["id"] ? UFUButtonColorType.secondary : UFUButtonColorType.secondaryLight,
                    buttonRadius: UFUButtonRadius.roundSquare,
                  ),

                ),
              ),

              const NewsHomeList()

            ],
          ),
        ),
      ),
    );
  }
}
