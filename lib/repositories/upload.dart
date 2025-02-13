import 'dart:io';

import 'package:easy_mart_app/core/utils/constants/network.dart';
import 'package:easy_mart_app/models/media.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/api_config/api_config.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class UploadRepo {
  Future<dynamic> document({String? filepath, String? category}) async {
    try {
      ShowUFULoader(msg: "Uploading Image");

      if(filepath?.isNotEmpty ?? false) {
        Map<String, dynamic>? response = await UFApiConfig().uploadFile(
            path: NetworkConsts.upload,
            fileParam: "image",
            file: File(filepath!),
            data: {"category" : category ?? "profile"}
        );

        if(response?["data"] != null) {
          Get.back();
          return MediaModel.fromJson(response?["data"]);
        }
      }
    } catch(e) {
      Get.back();
      UFUtils.handleError(e);
    }
  }
}