
import 'dart:convert';

import 'package:universal_flutter_utils/api_config/api_config.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../core/utils/constants/network.dart';
import '../models/user.dart';

class UserRepo {
  Future<Map<String, dynamic>?> getUserProfile({Map<String, dynamic>? params}) async {
    try {
      print(await UFUtils.preferences.readAuthToken());
      dynamic response = await UFApiConfig().get(NetworkConsts.userProfile);
      if(response["data"] != null) {
        await UFUtils.preferences.writeString(UFUtils.preferences.userData, jsonEncode(response["data"]));
        return response["data"];
      } else {
        return response;
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
    return null;
  }

  Future<Map<String, dynamic>?> verifyOTP({Map<String, dynamic>? params}) async {
    try {
      dynamic response = await UFApiConfig().post(NetworkConsts.verifyOTP, data: params);
      if(response["token"] != null) {
        await UFUtils.preferences.writeString(UFUtils.preferences.authToken, response["token"]);
        await UFUtils.preferences.writeBoolean(UFUtils.preferences.isLoggedIn, true);
        return {"token" : response["token"]};
      } else {
        return response;
      }
    } catch (e) {
      UFUtils.handleError(e);
    }
    return null;
  }

}


