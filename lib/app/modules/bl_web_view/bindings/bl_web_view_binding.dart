import 'package:get/get.dart';

import '../controllers/bl_web_view_controller.dart';

class BlWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlWebViewController>(
      () => BlWebViewController(),
    );
  }
}
