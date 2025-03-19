import 'package:get/get.dart';

import '../controllers/bl_home_controller.dart';

class BlHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlHomeController>(
      () => BlHomeController(),
    );
  }
}
