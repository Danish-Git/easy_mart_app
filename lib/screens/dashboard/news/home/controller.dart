import 'package:easy_mart_app/core/routes/pages.dart';
import 'package:easy_mart_app/core/utils/constants/navigation_arguments.dart';
import 'package:easy_mart_app/models/pagination.dart';
import 'package:easy_mart_app/repositories/news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../models/categories.dart';
import '../../../../models/news.dart';

class NewsHomeScreenController extends GetxController {

  Rx<List<CategoriesModel>?> categories = Rx(null);
  Rx<List<NewsPostModel>?> newsList = Rx(null);
  Rx<List<NewsPostModel>?> trendingNewsList = Rx(null);
  PaginationModel? newsListPagination;

  CategoriesModel? selectedCategory;
  PopoverActionModel? selectedLanguage;

  RxBool isLoading = false.obs;

  List<PopoverActionModel> languageList = [
    PopoverActionModel(
      label: "English",
      value: "en",
      icon: UFUIcon(
        Icons.translate_outlined,
        size: 16,
        color: AppTheme.themeColors.text,
      ),
    ),
    PopoverActionModel(
      label: "Hindi",
      value: "hi",
      icon: UFUIcon(
        Icons.temple_hindu_outlined,
        size: 16,
        color: AppTheme.themeColors.text,
      ),
    ),
    PopoverActionModel(
      label: "Punjabi",
      value: "pb",
      icon: UFUIcon(
        Icons.mosque_outlined,
        size: 16,
        color: AppTheme.themeColors.text,
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    languageList.first.isSelected = true;
    selectedLanguage = languageList.first;
    selectedCategory = categories.value?.firstOrNull;

    loadData();
  }

  void loadData() {
    Future.wait(<Future<dynamic>> [
      Future.delayed(Duration.zero, () => isLoading.value = true),
      fetchCategories(),
    ]).whenComplete(() => Future.wait(<Future<dynamic>> [
      if(selectedCategory != null)...[
        fetchNews(),
        fetchTrendingNews(),
      ]
    ]).whenComplete(() {
      isLoading.value = false;
      if(selectedCategory == null) {
        trendingNewsList.value = [];
        newsList.value = [];
        newsListPagination?.totalItems = null;
      }
      update();
    }));
  }

  Future<void> fetchCategories() async {
    try {
      List<CategoriesModel>? response = await NewsRepo().fetchCategories(lang: selectedLanguage?.value ?? "en");
      if (response != null) {
        categories.value = response;
        selectedCategory = categories.value?.firstOrNull;
      }
    } catch (e) {
      UFUtils.handleError(e);
    } finally {
      update();
    }
  }

  Future<void> fetchNews() async {
    try {
      Map<String, dynamic> params = {
        "language": selectedLanguage?.value ?? "en",
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
      update();
    }
  }

  Future<void> fetchTrendingNews() async {
    try {
      Map<String, dynamic> params = {
        "language": selectedLanguage?.value ?? "en",
        "category": selectedCategory?.id,
        "page": 1,
        "page_size": 10
      };
      Map<String, dynamic>? response = await NewsRepo().fetchNews(params: params, isTrending: true);
      if (response != null) {
        trendingNewsList.value = response["list"];
      }
    } catch (e) {
      UFUtils.handleError(e);
    } finally {
      update();
    }
  }

  void onLanguageSelect(PopoverActionModel selectedPopup) {
    selectedLanguage = selectedPopup;

    for (var item in languageList) {
      item.isSelected = false;
    }

    languageList.firstWhere((item) => item.value == selectedPopup.value).isSelected = true;
    loadData();
  }

  Future<void> updateSelectedFilter(int index) async {
    selectedCategory = categories.value?[index];
    update();
    await fetchNews();
  }

  void navigateToNewsDetail(int index, {bool isTrending = false}) {
    Get.toNamed(Routes.newsDetail, arguments: {
      NavigationArgs.news: isTrending
          ? (trendingNewsList.value !=null) ? trendingNewsList.value![index] : null
          : newsList.value?[index],
    });
  }

  void navigateToNewsList({bool isTrending = false}) {
    Get.toNamed(Routes.newsList, arguments: {
      NavigationArgs.language: "en",
      NavigationArgs.newsCategory: selectedCategory,
      NavigationArgs.isTrending: isTrending,
    });
  }
}