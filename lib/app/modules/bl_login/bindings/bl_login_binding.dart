import 'package:get/get.dart';

import '../controllers/bl_login_controller.dart';

class BlLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlLoginController>(
      () => BlLoginController(),
    );
  }
}
