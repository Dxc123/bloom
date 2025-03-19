import 'package:get/get.dart';

import '../controllers/bl_me_feedback_controller.dart';

class BlMeFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeFeedbackController>(
      () => BlMeFeedbackController(),
    );
  }
}
