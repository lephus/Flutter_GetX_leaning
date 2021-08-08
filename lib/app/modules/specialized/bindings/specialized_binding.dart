import 'package:get/get.dart';

import '../controllers/specialized_controller.dart';

class SpecializedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecializedController>(
      () => SpecializedController(),
    );
  }
}
