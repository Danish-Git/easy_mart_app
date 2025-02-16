class NetworkConsts {
  static const String suffixURL = "http://aapkedukan.in:8000";
  static const String prefixURL = "/api/v1/";
  static const String baseURL = "$suffixURL$prefixURL";
  ///   Onboarding
  static const String sendOTP = "send_otp/";
  static const String verifyOTP = "verify_otp/";
  ///   User
  static const String userProfile = "user/get_profile/";
  static const String updateProfile = "user/update_profile/";
  ///   Upload media
  static const String upload = "upload-photo/";
  ///   News
  static const String postNews = "news/post_news/";
}