import 'package:easy_mart_app/models/news_post_model.dart';
import 'package:universal_flutter_utils/api_config/api_config.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../core/utils/constants/network.dart';

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
}