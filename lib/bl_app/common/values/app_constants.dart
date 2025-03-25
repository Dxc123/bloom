import 'package:get/get_utils/src/platform/platform.dart';

class AppConstants {
  static bool _isFakeMode = false; // 当前是审核模式？

  // 是否有签到模块(默认无，针对 UI 签到功能(聊天卡、头像框、道具背包功能))
  static bool hasSign = true;

  // adjust 配置
  static String adjustToken = GetPlatform.isIOS == true ? "gmpy81cs9ngg" : "";
  static String adjustEvent = GetPlatform.isIOS == true ? "7l17fd" : "";
  static String adjustGoogleEventKey = GetPlatform.isIOS == true ? "" : "";

  //在充值中心是否点击充值
  static bool isClickCharge = false;
  //是否在匹配中...
  static bool isMatching = false;

  // getter
  static bool get isFakeMode {
    return AppConstants._isFakeMode;
  }

  // setter
  static set isFakeMode(bool fakeMode) {
    AppConstants._isFakeMode = fakeMode;
  }

  /// 0正常模式，1安卓审核模式，2苹果审核模式
  /// 正常模式：底部先首页后匹配，首页分热门主播、在线主播、关注
  /// 安卓审核模式：去掉了匹配，隐藏打电话按钮
  /// 苹果审核模式：底部先匹配，后首页。首页分动态、关注
  static int get appMode {
    if (AppConstants.isFakeMode) {
      if (GetPlatform.isAndroid) {
        return 1;
      } else if (GetPlatform.isIOS) {
        return 2;
      }
    } else {
      return 0;
    }
    return 0;
  }

  static const giftsJson = "giftsJson"; //
  static const gameGiftsJson = "gameGiftsJson";
  static const testModeStyle = "testModeStyle"; //
  static const blackList = "blackList"; //
  static const hadShowDragTip = "hadShowDragTip"; //
  static const bowlingDrag = 'bowlingDrag';
  static const systemId = "9999"; //
  // 为了ios审核，加上这个聊天对象，方便做UGC
  static const serviceId = "10000"; //
}
