import 'package:get/get.dart';

import '../controllers/bl_discover_controller.dart';

class BlDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlDiscoverController>(
      () => BlDiscoverController(),
    );
  }
}
