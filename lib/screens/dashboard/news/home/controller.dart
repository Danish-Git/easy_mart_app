import 'package:easy_mart_app/models/pagination.dart';
import 'package:easy_mart_app/repositories/news.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../models/categories.dart';
import '../../../../models/news.dart';

class NewsHomeScreenController extends GetxController {

  Rx<List<CategoriesModel>?> categories = Rx(null);
  Rx<List<NewsPostModel>?> newsList = Rx(null);
  PaginationModel? newsListPagination;

  CategoriesModel? selectedCategory;

  RxBool isLoadingCategories = false.obs;
  RxBool isLoadingTrending = false.obs;
  RxBool isLoadingNews = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedCategory = categories.value?.firstOrNull;
    loadData();
  }

  void loadData() {
    Future.wait(<Future<dynamic>> [
      fetchCategories(),
    ]).whenComplete(() => Future.wait(<Future<dynamic>> [
      fetchNews()
    ]).whenComplete(() => update()));
  }

  Future<void> fetchCategories() async {
    try {
      isLoadingCategories.value = true;
      List<CategoriesModel>? response = await NewsRepo().fetchCategories(lang: "en");
      if (response != null) {
        categories.value = response;
        selectedCategory = categories.value?.firstOrNull;
      }
    } catch (e) {
      UFUtils.handleError(e);
    } finally {
      isLoadingCategories.value = false;
      update();
    }
  }

  Future<void> fetchNews() async {
    try {
      isLoadingNews.value = true;
      Map<String, dynamic> params = {
        "language": "en",
        "category": selectedCategory?.id,
        "page": 1,
        "page_size": 10
      };
      Map<String, dynamic>? response = await NewsRepo().fetchNews(params: params);
      if (response != null) {
        newsList.value = response["list"];
        newsListPagination = response["pagination"];
      }
    } catch (e) {
      UFUtils.handleError(e);
    } finally {
      isLoadingNews.value = false;
    }
  }

  Future<void> updateSelectedFilter(int index) async {
    selectedCategory = categories.value?[index];
    update();
    await fetchNews();
  }
}