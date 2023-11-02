import 'package:get/get.dart';
import 'package:practicalMap/detailScreen/detailScreen_controller.dart';

class DetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailScreenController>(DetailScreenController());
  }
}

