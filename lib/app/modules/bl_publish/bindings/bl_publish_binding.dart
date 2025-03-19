import 'package:get/get.dart';

import '../controllers/bl_publish_controller.dart';

class BlPublishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlPublishController>(
      () => BlPublishController(),
    );
  }
}
