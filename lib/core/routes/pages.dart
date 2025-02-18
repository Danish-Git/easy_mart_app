import 'package:easy_mart_app/screens/dashboard/news/news_list/index.dart';
import 'package:easy_mart_app/screens/profile/index.dart';
import 'package:get/get.dart';

import '../../screens/dashboard/news/dashboard/index.dart';
import '../../screens/dashboard/news/news_detail/index.dart';
import '../../screens/login/index.dart';
import '../../screens/splash/index.dart';
import '../../screens/validate_otp/index.dart';
part './routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.validateOtp,
      page: () => const ValidateOTPScreen(),
    ),
    GetPage(
      name: Routes.newsDashboard,
      page: () => const NewsDashboardScreen(),
    ),
    GetPage(
      name: Routes.newsList,
      page: () => const NewsListScreen(),
    ),
    GetPage(
      name: Routes.newsDetail,
      page: () => const NewsDetailScreen(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
    ),
  ];
}