import 'package:get/get.dart';

import '../controllers/bl_me_river_pod_controller.dart';

class BlMeRiverPodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeRiverPodController>(
      () => BlMeRiverPodController(),
    );
  }
}
