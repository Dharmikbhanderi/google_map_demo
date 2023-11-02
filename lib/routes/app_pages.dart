import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:practicalMap/detailScreen/detailScreen_binding.dart';
import 'package:practicalMap/detailScreen/detailScreen_view.dart';
import 'package:practicalMap/listScreen/homeScreen_binding.dart';
import 'package:practicalMap/listScreen/homeScreen_view.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.homeScreen;

  static final routes = [

    GetPage(
        name: _Paths.homeScreen,
        title: 'home',
        transition: Transition.noTransition,
        page: () => HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.detailScreen,
        title: 'detailScreen',
        transition: Transition.noTransition,
        page: () => DetailScreen(),
        binding: DetailScreenBinding()),
  ];
}
