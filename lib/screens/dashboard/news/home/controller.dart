import 'package:get/get.dart';

class NewsHomeScreenController extends GetxController {

  List<Map<String, dynamic>> filters = [
    {"id": 1, "label": "Feature"},
    {"id": 2, "label": "Policies"},
    {"id": 3, "label": "Cricket"},
    {"id": 4, "label": "International"}
  ];

  Map<String, dynamic>? selectedFilter;

  @override
  void onInit() {
    super.onInit();
    selectedFilter = filters.first;
  }

  void updateSelectedFilter(int index) {
    selectedFilter = filters[index];
    update();
  }
}