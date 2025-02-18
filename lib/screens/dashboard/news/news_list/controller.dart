import 'package:easy_mart_app/core/utils/constants/navigation_arguments.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../core/routes/pages.dart';
import '../../../../models/categories.dart';
import '../../../../models/news.dart';
import '../../../../models/pagination.dart';
import '../../../../repositories/news.dart';

class NewsListController extends GetxController {

  String? language = Get.arguments?[NavigationArgs.language];
  CategoriesModel? category = Get.arguments?[NavigationArgs.newsCategory];
  bool? isTrending = Get.arguments?[NavigationArgs.isTrending] ?? false;

  RxBool isLoadingNews = false.obs;
  RxBool isLoadMore = false.obs;
  RxBool canShowLoadMore = false.obs;

  Rx<List<NewsPostModel>?> newsList = Rx(null);
  PaginationModel pages = PaginationModel();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    isLoadingNews.value = true;
    Future.wait(<Future<dynamic>> [
      fetchNews()
    ]).whenComplete(() => update());
  }


  Future<void> fetchNews() async {
    try {
      Map<String, dynamic> params = {
        "language": language,
        "category": category?.id,
        "page": pages.currentPage,
        "page_size": pages.pageSize
      };
      Map<String, dynamic>? response = await NewsRepo().fetchNews(params: params, isTrending: isTrending);
      if (response != null) {

        if (!isLoadMore.isTrue) {
          newsList.value = [];
        }

        newsList.value?.addAll(response["list"]);
        pages = response["pagination"];
        canShowLoadMore.value = int.parse(pages.currentPage?.toString() ?? "1")
            < int.parse(pages.totalPages?.toString() ?? "1");
      }
    } catch (e) {
      UFUtils.handleError(e);
    } finally {
      isLoadingNews.value = false;
    }
  }

  Future<void> refreshList({bool? showLoading}) async {
    pages.currentPage = 1;
    isLoadingNews.value = true;

    update();
    await fetchNews();
  }

  Future<void> loadMore() async {
    pages.currentPage = int.parse(pages.currentPage?.toString() ?? "0") + 1;
    isLoadMore.value = true;
    await fetchNews();
  }

  void navigateToNewsDetail(int index) {
    Get.toNamed(Routes.newsDetail, arguments: {
      NavigationArgs.news: newsList.value?[index],
    });
  }

}