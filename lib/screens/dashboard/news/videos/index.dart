import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';
import 'package:universal_flutter_utils/widgets/listview/index.dart';

import '../../../../core/common_widgets/app_bar.dart';
import '../home/widgets/news_shimmer.dart';
import 'controller.dart';
import 'widgets/video_tile.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideosScreenController>(
      global: false,
      init: VideosScreenController(),
      builder: (controller) => UFUScaffold(
        appBar: EMAppBar(
          title: "Videos",
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(() => controller.isLoading.isTrue
              ? const NewsShimmer()
              : UFUListView(
                  shrinkWrap: true,
                  listCount: controller.videosList.value?.length ?? 0,
                  onLoadMore: controller.canShowLoadMore.isTrue ? controller.loadMore : null,
                  onRefresh: controller.refreshList,
                  isGridView: true,
                  itemBuilder: (context, index) {
                    if(index < (controller.videosList.value?.length ?? 0)) {
                      return VideoTile(
                          video: controller.videosList.value?[index],
                          onTap: () => controller.navigateToVideoDetail(index)
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
      )
    );
  }
}
