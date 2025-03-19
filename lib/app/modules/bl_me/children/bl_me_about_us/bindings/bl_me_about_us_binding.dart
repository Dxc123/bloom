import 'package:get/get.dart';

import '../controllers/bl_me_about_us_controller.dart';

class BlMeAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeAboutUsController>(
      () => BlMeAboutUsController(),
    );
  }
}
