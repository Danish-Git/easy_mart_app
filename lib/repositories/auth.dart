import 'package:easy_mart_app/core/utils/constants/network.dart';
import 'package:universal_flutter_utils/api_config/api_config.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class AuthRepo {
  Future<Map<String, dynamic>?> sendOTP({Map<String, dynamic>? params}) async {
    try {
      dynamic response = await UFApiConfig().post(NetworkConsts.sendOTP, data: params);
      if(response["data"] != null) {
        return {"otp_id": response["data"]["id"]};
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