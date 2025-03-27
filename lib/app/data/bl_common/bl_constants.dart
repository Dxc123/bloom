import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../bl_service/bl_my_info_service.dart';

class BlConstants {
  static bool isTestMode = false; //切换测试环境开关，发包要注意改成: false
  static bool haveTestLogin = false; //测试数字登录显示开关 ,发包要注意改成: false

  static bool hasInPurchase = false; //是否有内购模块

  // app名称   //正式 com.hichat.project
  static const appName = 'HiChat';
  static const appNameLower = 'hichat';

  //渠道名
  static String channelName = GetPlatform.isIOS == true ? '${appNameLower}200' : '${appNameLower}100';

  // //测试   // com.hani.iostest
  // static const appName = 'Hubu';
  // static const appNameLower = 'hubu';
  // //渠道名 内购项 hubu199 hubu299 hubu399 hubu499
  // //  沙盒账号：haniios2024@qq.com 密码Qwer2024
  // static String channelName = GetPlatform.isIOS == true ? 'hubu200' : 'hubu100';

  // iOS APP  appID
  static const appId = 'xxxxx';

  // iOS 谷歌登录配置
  // (登录代码配置了,Info.plist里面就不用配置了，具体说明见 dart库google_sign_in)
  static const googleSignInClientId = '';
  static const googleSignInServerClientId = '';

//  新域名：api.hichatl.com    wss3.hichatl.com
  // 预发版本
  static const String socketBaseUrl_pre = "wss://pre.hichatl.com/socket";
  static const String configBaseUrl_pre = "https://pre.hichatl.com/v2";
  static const String baseUrl_pre = "$configBaseUrl_pre/api";

  // 内网wss://test.hanilink.com/socket
  static const String socketBaseUrl_test = "wss://test.hanilink.com/socket";

  // https://test.hanilink.com
  static const String configBaseUrl_test = "https://test.hanilink.com";
  static const String baseUrl_test = "$configBaseUrl_test/api";

  // 正式
  static const String socketBaseUrl = "wss://api.hichatl.com/socket";
  static const String configBaseUrl = "https://api.hichatl.com";
  static const String baseUrl = "$configBaseUrl/api";

  //
  static const privacyPolicy = "https://api.hichatl.com/page/Privacy_Policy.html";
  static const agreement = "https://api.hichatl.com/page/agreement.html";

  static const String imageSuffix = "?spm=qipa250&x-oss-process=video/snapshot,t_7000,f_jpg,w_800,h_600,m_fast";
  static const giftsJson = "giftsJson";

  static String getConfigBaseUrl() {
    String url = BlConstants.configBaseUrl;
    if (!BlConstants.isTestMode) {
      return url;
    }
    //test mode 0线上，1预发布，2测试
    switch (AppMyInfoService.to.getTestStyle) {
      case 0:
        url = BlConstants.configBaseUrl;
        break;
      case 1:
        url = BlConstants.configBaseUrl_pre;
        break;
      case 2:
        url = BlConstants.configBaseUrl_test;
        break;
      default:
        url = BlConstants.isTestMode ? BlConstants.configBaseUrl_test : BlConstants.configBaseUrl;
        break;
    }
    debugPrint("BlLogger--getConfigBaseUrl = $url");
    return url;
  }

  static String getSocketBaseUrl() {
    String url = BlConstants.socketBaseUrl;
    if (!BlConstants.isTestMode) {
      return url;
    }
    switch (AppMyInfoService.to.getTestStyle) {
      case 0:
        url = BlConstants.socketBaseUrl;
        break;
      case 1:
        url = BlConstants.socketBaseUrl_pre;
        break;
      case 2:
        url = BlConstants.socketBaseUrl_test;
        break;
      default:
        url = BlConstants.isTestMode ? BlConstants.socketBaseUrl_test : BlConstants.socketBaseUrl;
        break;
    }
    return url;
  }

  static String getBaseUrl() {
    String url = BlConstants.baseUrl;
    if (!BlConstants.isTestMode) {
      return url;
    }
    switch (AppMyInfoService.to.getTestStyle) {
      case 0:
        url = BlConstants.baseUrl;
        break;
      case 1:
        url = BlConstants.baseUrl_pre;
        break;
      case 2:
        url = BlConstants.baseUrl_test;
        break;
      default:
        url = BlConstants.isTestMode ? BlConstants.baseUrl_test : BlConstants.baseUrl;
        break;
    }
    // BlLogger.debug("getBaseUrl = $url");
    return url;
  }
}

///安全find
S? safeFind<S>({String? tag}) {
  if (Get.isRegistered<S>() == true) {
    final s = Get.find<S>(tag: tag);
    return s;
  }
  return null;
}
