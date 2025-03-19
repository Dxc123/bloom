import 'package:get/get.dart';

import '../controllers/bl_me_black_list_controller.dart';

class BlMeBlackListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeBlackListController>(
      () => BlMeBlackListController(),
    );
  }
}
