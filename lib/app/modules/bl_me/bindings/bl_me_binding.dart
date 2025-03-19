import 'package:get/get.dart';

import '../controllers/bl_me_controller.dart';

class BlMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeController>(
      () => BlMeController(),
    );
  }
}
