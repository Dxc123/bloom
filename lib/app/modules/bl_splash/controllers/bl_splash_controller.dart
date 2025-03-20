import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class BlSplashController extends GetxController {
  //TODO: Implement BlSplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
      Get.offNamed(Routes.BL_LOGIN);
    });
  }



  void increment() => count.value++;
}
