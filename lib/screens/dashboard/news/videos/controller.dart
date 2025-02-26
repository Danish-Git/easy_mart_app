import 'package:easy_mart_app/core/utils/constants/navigation_arguments.dart';
import 'package:easy_mart_app/models/videos.dart';
import 'package:easy_mart_app/repositories/videos.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../core/routes/pages.dart';
import '../../../../models/pagination.dart';

class VideosScreenController extends GetxController {
  Rx<List<VideosModel>?> videosList = Rx(null);
  PaginationModel pages = PaginationModel();

  RxBool isLoading = false.obs;
  RxBool isLoadMore = false.obs;
  RxBool canShowLoadMore = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    isLoading.value = true;
    Future.wait(<Future<dynamic>> [
      fetchVideos()
    ]).whenComplete(() => update());
  }

  Future<void> fetchVideos() async {
    try {
      Map<String, dynamic> params = {
        "page": pages.currentPage,
        "page_size": pages.pageSize
      };
      Map<String, dynamic>? response = await VideosRepo().fetchVideos(params: params);
      if (response != null) {

        if (!isLoadMore.isTrue) {
          videosList.value = [];
        }

        videosList.value?.addAll(response["list"]);
        pages = response["pagination"];
        canShowLoadMore.value = int.parse(pages.currentPage?.toString() ?? "1") < int.parse(pages.totalPages?.toString() ?? "1");
      }
    } catch (e) {
      UFUtils.handleError(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> refreshList() async {
    pages.currentPage = 1;
    isLoading.value = true;

    update();
    await fetchVideos();
  }

  Future<void> loadMore() async {
    pages.currentPage = int.parse(pages.currentPage?.toString() ?? "0") + 1;
    isLoadMore.value = true;
    await fetchVideos();
  }

  void navigateToVideoDetail(int index) {
    Get.toNamed(Routes.viewVideos, arguments: {
      NavigationArgs.videoUrl: videosList.value?[index].videoUrl
    });
  }
}