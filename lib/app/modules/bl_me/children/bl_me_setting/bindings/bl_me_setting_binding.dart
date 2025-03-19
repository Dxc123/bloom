import 'package:get/get.dart';

import '../controllers/bl_me_setting_controller.dart';

class BlMeSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeSettingController>(
      () => BlMeSettingController(),
    );
  }
}
