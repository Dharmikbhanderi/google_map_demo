import 'package:get/get.dart';


class  DetailScreenController extends GetxController {
  final detailName = "".obs;
  final RxDouble detailLat = 0.0.obs;
  final RxDouble detailLon = 0.0.obs;
  final detailCountry = "".obs;
  final detailIcao = "".obs;
  final detailCity = "".obs;
  final detailState = "".obs;
  final detailTz = "".obs;

  @override
  void onInit() {
    super.onInit();
    detailName.value = Get.arguments["name"] ?? "";
    detailLat.value = Get.arguments["lat"] ?? "";
    detailLon.value = Get.arguments["lon"] ?? "";
    detailCountry.value = Get.arguments["country"] ?? "";
    detailIcao.value = Get.arguments["icao"] ?? "";
    detailCity.value = Get.arguments["city"] ?? "";
    detailState.value = Get.arguments["state"] ?? "";
    detailTz.value = Get.arguments["tz"] ?? "";
  }
}




