import 'package:get/get.dart';

import '../controllers/bl_conversation_controller.dart';

class BlConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlConversationController>(
      () => BlConversationController(),
    );
  }
}
