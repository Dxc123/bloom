import 'package:get/get.dart';

import '../controllers/bl_chat_controller.dart';

class BlChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlChatController>(
      () => BlChatController(),
    );
  }
}
