import 'package:get/get.dart';

import 'package:todo_getx/app/modules/home/bindings/home_binding.dart';
import 'package:todo_getx/app/modules/home/views/home_view.dart';
import 'package:todo_getx/app/modules/specialized/bindings/specialized_binding.dart';
import 'package:todo_getx/app/modules/specialized/views/specialized_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPECIALIZED,
      page: () => SpecializedView(),
      binding: SpecializedBinding(),
    ),
  ];
}
