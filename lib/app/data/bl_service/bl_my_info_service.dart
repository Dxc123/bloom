import 'package:get/get.dart';

import '../bl_common/bl_constants.dart';
import '../bl_untils/bl_storage.dart';

class AppMyInfoService extends GetxService {
  static AppMyInfoService get to => Get.find();

  Future<AppMyInfoService> init() async {
    return this;
  }

  //test mode 0线上，1预发布，2测试
  void saveTestStyle(int mode) async {
    await BlStorage.write("appTestStyle", mode);
  }

  int get getTestStyle {
    int? show = BlStorage.read("appTestStyle");
    return show ?? (BlConstants.isTestMode ? 0 : 0);
  }

  /// 登录相关/////////////////////////
  var agree = false.obs;

  //同意协议
  void syncAgreeStatus() {
    agree.value = !agree.value;
    BlStorage.write("syncAgreeStatus", agree.value);
  }

  bool getAgreementStatus() {
    return BlStorage.read("syncAgreeStatus") ?? false;
  }
}
