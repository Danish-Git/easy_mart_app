import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';
import 'package:universal_flutter_utils/widgets/listview/index.dart';

import '../../../../core/common_widgets/app_bar.dart';
import '../home/widgets/news_shimmer.dart';
import '../home/widgets/news_tile.dart';
import 'controller.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsListController>(
      global: false,
      init: NewsListController(),
      builder: (controller) => UFUScaffold(
        appBar: EMAppBar(
          title: "${controller.category?.title ?? ""}"
              "${controller.isTrending ?? false ? " (Trending)" : ""}",
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(() => controller.isLoadingNews.isTrue
              ? const NewsShimmer()
              : UFUListView(
                shrinkWrap: true,
                listCount: controller.newsList.value?.length ?? 0,
                onLoadMore: controller.canShowLoadMore.isTrue ? controller.loadMore : null,
                onRefresh: controller.refreshList,
                itemBuilder: (context, index) {
                  if(index < (controller.newsList.value?.length ?? 0)) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: NewsTile(
                        news: controller.newsList.value?[index],
                        onTap: () => controller.navigateToNewsDetail(index)
                      ),
                    );
                  } else if (controller.canShowLoadMore.isTrue) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(child: FadingCircle(color: AppTheme.themeColors.primary, size: 25)),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }
            )
            ),
          ),
        ),
      ),
    );
  }

  // temp() => ListView.separated(
  //   itemCount:
  //   shrinkWrap: true,
  //   padding: const EdgeInsets.only(top: 10),
  //   separatorBuilder: (context, index) => const SizedBox(height: 10),
  //   itemBuilder: (context, index) => NewsTile(
  //       news: controller.newsList.value?[index],
  //       onTap: () => controller.navigateToNewsDetail(index)
  //   ),
  // )
}
