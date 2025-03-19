import 'package:get/get.dart';

import '../controllers/bl_me_my_publish_controller.dart';

class BlMeMyPublishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeMyPublishController>(
      () => BlMeMyPublishController(),
    );
  }
}
