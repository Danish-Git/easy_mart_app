import 'package:easy_mart_app/models/news.dart';
import 'package:easy_mart_app/models/pagination.dart';
import 'package:universal_flutter_utils/api_config/api_config.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../core/utils/constants/network.dart';
import '../models/categories.dart';

class NewsRepo {
  Future<NewsPostModel?> postNews({Map<String, dynamic>? params}) async {
    try {
      Map<String, dynamic>? response = await UFApiConfig().post(NetworkConsts.postNews, data: params);
      if(response != null) {
        return NewsPostModel.fromJson(response);
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
    return null;
  }

  Future<Map<String, dynamic>?> fetchNews({Map<String, dynamic>? params, bool? isTrending}) async {
    try {
      Map<String, dynamic>? response = await UFApiConfig().get(
          isTrending ?? false ? NetworkConsts.fetchTrendingNews : NetworkConsts.fetchNews, queryParameters: params);
      if(response?["data"] != null) {
        List<NewsPostModel> newsList = [];
        for (var news in (response?["data"] as List)) {
          newsList.add(NewsPostModel.fromJson(news));
        }

        PaginationModel? paginationModel;
        if(response?["meta_data"] != null) {
          paginationModel = PaginationModel.fromJson(response?["meta_data"]);
        }

        return <String, dynamic>{
          "list": newsList,
          "pagination": paginationModel
        };
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
    return null;
  }

  Future<List<CategoriesModel>?> fetchCategories({String? lang}) async {
    try {
      Map<String, dynamic>? response = await UFApiConfig().get(NetworkConsts.fetchCategories(lang ?? "en"));
      if(response?["data"] != null) {
        List<CategoriesModel> categoryList = [];
        for (var news in (response?["data"] as List)) {
          categoryList.add(CategoriesModel.fromJson(news));
        }
        return categoryList;
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
    return null;
  }
}