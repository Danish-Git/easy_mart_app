import 'package:easy_mart_app/models/pagination.dart';
import 'package:easy_mart_app/models/videos.dart';
import 'package:universal_flutter_utils/api_config/api_config.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../core/utils/constants/network.dart';

class VideosRepo {
  Future<VideosModel?> postVideo({Map<String, dynamic>? params}) async {
    try {
      Map<String, dynamic>? response = await UFApiConfig().post(NetworkConsts.postNews, data: params);
      if(response != null) {
        return VideosModel.fromJson(response);
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
    return null;
  }

  Future<Map<String, dynamic>?> fetchVideos({Map<String, dynamic>? params}) async {
    try {
      Map<String, dynamic>? response = await UFApiConfig().get(NetworkConsts.fetchVideos, queryParameters: params);
      if(response?["data"] != null) {
        List<VideosModel> newsList = [];
        for (var news in (response?["data"] as List)) {
          newsList.add(VideosModel.fromJson(news));
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
}