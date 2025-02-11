import 'package:get/get.dart';

import '../../screens/dashboard/news/dashboard/index.dart';
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
  ];
}