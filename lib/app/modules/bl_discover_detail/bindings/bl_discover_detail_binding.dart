import 'package:get/get.dart';

import '../controllers/bl_discover_detail_controller.dart';

class BlDiscoverDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlDiscoverDetailController>(
      () => BlDiscoverDetailController(),
    );
  }
}
