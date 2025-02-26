import 'package:easy_mart_app/core/utils/constants/assets.dart';
import 'package:easy_mart_app/screens/dashboard/news/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../news_shimmer.dart';
import '../news_tile.dart';
import '../trending_news_shimmer.dart';
import '../trending_news_tile.dart';

class NewsHomeList extends StatelessWidget {
  const NewsHomeList({
    super.key,
    required this.controller
  });

  final NewsHomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UFUText(text: "Trending news", fontWeight: UFUFontWeight.bold,),
                if((controller.trendingNewsList.value?.length ?? 0) > 2)
                  UFUTextButton(
                    onPressed: () => controller.navigateToNewsList(isTrending: true),
                    text: "See All",
                    color: AppTheme.themeColors.secondaryText,
                  )
              ],
            ),
            SizedBox(
              height: 252,
              child: controller.isLoading.isTrue
                ? const TrendingNewsShimmer()
                : UFUtils.isValueNullOrEmpty(controller.categories.value)
                  ? const UFUNoDataFound(
                      icon: Icons.newspaper_outlined,
                      iconSize: 80,
                      title: "Oops! There’s no trending news right now. Stay tuned for updates!",
                    )
                  :  ListView.separated(
                    itemCount: controller.trendingNewsList.value?.length ?? 0,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) =>  TrendingNewsTile(
                      onTap: () => controller.navigateToNewsDetail(index, isTrending: true),
                      news: controller.trendingNewsList.value?[index],
                    )
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UFUText(text: "Recommended", fontWeight: UFUFontWeight.bold,),
                  if((controller.newsListPagination?.totalItems ?? 0) > (controller.newsListPagination?.pageSize ?? 0))
                    UFUTextButton(
                      onPressed: () => controller.navigateToNewsList(),
                      text: "See All",
                      color: AppTheme.themeColors.secondaryText,
                    )
                ],
              ),
            ),

            controller.isLoading.isTrue
              ? const NewsShimmer()
              : UFUtils.isValueNullOrEmpty(controller.newsList.value)
                ? const UFUNoDataFound(
                    icon: Icons.newspaper_outlined,
                    iconSize: 80,
                    title: "Oops! There’s no news right now. Stay tuned for updates!",
                  )
                : ListView.separated(
                  itemCount: controller.newsList.value?.length ?? 0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) => NewsTile(
                    news: controller.newsList.value?[index],
                    onTap: () => controller.navigateToNewsDetail(index)
                  ),
                ),


            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const UFUText(text: "Others", fontWeight: UFUFontWeight.bold,),
            //       UFUTextButton(
            //         onPressed: () => controller.navigateToNewsList(),
            //         text: "See All",
            //         color: AppTheme.themeColors.secondaryText,
            //       )
            //     ],
            //   ),
            // ),
            //
            // ListView.separated(
            //   itemCount: 3,
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.only(top: 10),
            //   physics: const NeverScrollableScrollPhysics(),
            //   separatorBuilder: (context, index) => const SizedBox(height: 10),
            //   itemBuilder: (context, index) => Material(
            //     color: AppTheme.themeColors.brown,
            //     borderRadius: const BorderRadius.only(
            //       topRight: Radius.circular(20),
            //       bottomLeft: Radius.circular(20),
            //       bottomRight: Radius.circular(20),
            //     ),
            //     child: InkWell(
            //       onTap: () {},
            //       borderRadius: const BorderRadius.only(
            //         topRight: Radius.circular(20),
            //         bottomLeft: Radius.circular(20),
            //         bottomRight: Radius.circular(20),
            //       ),
            //       child: Container(
            //         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: AppTheme.themeColors.yellow,
            //             width: 2
            //           ),
            //           borderRadius: const BorderRadius.only(
            //             topRight: Radius.circular(20),
            //             bottomLeft: Radius.circular(20),
            //             bottomRight: Radius.circular(20),
            //           )
            //         ),
            //         child: UFUText(
            //           text: "बिगड़ने वाला है देश के इन राज्यों में मौसम, पढ़ें IMD की 5 ...",
            //           textColor: AppTheme.themeColors.base,
            //           fontWeight: UFUFontWeight.bold,
            //         )
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 100)

          ],
        ),
      ),
    );
  }
}
