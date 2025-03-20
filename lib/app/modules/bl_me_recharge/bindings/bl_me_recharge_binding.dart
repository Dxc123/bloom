import 'package:get/get.dart';

import '../controllers/bl_me_recharge_controller.dart';

class BlMeRechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeRechargeController>(
      () => BlMeRechargeController(),
    );
  }
}
