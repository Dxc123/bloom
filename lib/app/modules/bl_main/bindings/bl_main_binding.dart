import 'package:get/get.dart';

import '../controllers/bl_main_controller.dart';

class BlMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMainController>(
      () => BlMainController(),
    );
  }
}
