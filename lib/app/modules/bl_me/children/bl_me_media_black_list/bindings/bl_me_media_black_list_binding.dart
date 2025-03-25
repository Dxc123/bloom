import 'package:get/get.dart';

import '../controllers/bl_me_media_black_list_controller.dart';

class BlMeMediaBlackListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeMediaBlackListController>(
      () => BlMeMediaBlackListController(),
    );
  }
}
