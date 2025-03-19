import 'package:get/get.dart';

class BlConstants {
  static bool hasVisitorLogin = true; //是否-没有接口登录
}

///安全find
S? safeFind<S>({String? tag}) {
  if (Get.isRegistered<S>() == true) {
    final s = Get.find<S>(tag: tag);
    return s;
  }
  return null;
}
