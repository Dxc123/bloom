import 'package:get/get.dart';

import '../controllers/bl_me_my_like_list_controller.dart';

class BlMeMyLikeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeMyLikeListController>(
      () => BlMeMyLikeListController(),
    );
  }
}
