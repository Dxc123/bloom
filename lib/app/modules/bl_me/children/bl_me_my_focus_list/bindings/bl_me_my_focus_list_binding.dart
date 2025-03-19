import 'package:get/get.dart';

import '../controllers/bl_me_my_focus_list_controller.dart';

class BlMeMyFocusListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeMyFocusListController>(
      () => BlMeMyFocusListController(),
    );
  }
}
