import 'package:easy_mart_app/core/utils/constants/navigation_arguments.dart';
import 'package:easy_mart_app/models/news.dart';
import 'package:get/get.dart';

class NewsDetailController extends GetxController {

  NewsPostModel? news = Get.arguments?[NavigationArgs.news];

}