import 'package:get/get.dart';
import 'package:practicalMap/listScreen/homeScreen_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeScreenController>(HomeScreenController());
  }
}

