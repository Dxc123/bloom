import 'package:get/get.dart';

import '../controllers/bl_me_edit_controller.dart';

class BlMeEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeEditController>(
      () => BlMeEditController(),
    );
  }
}
