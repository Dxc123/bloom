import 'package:get/get.dart';

import '../controllers/bl_home_detail_controller.dart';

class BlHomeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlHomeDetailController>(
      () => BlHomeDetailController(),
    );
  }
}
