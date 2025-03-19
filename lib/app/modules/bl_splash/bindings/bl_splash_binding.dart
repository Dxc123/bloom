import 'package:get/get.dart';

import '../controllers/bl_splash_controller.dart';

class BlSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlSplashController>(
      () => BlSplashController(),
    );
  }
}
