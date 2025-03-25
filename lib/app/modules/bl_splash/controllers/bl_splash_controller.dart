import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:get/get.dart';

import '../../../../bl_app/models/app_config_entity.dart';
import '../../../../bl_app/models/app_info_entity.dart';
import '../../../../bl_app/models/app_login_entity.dart';
import '../../../data/bl_api/bl_https.dart';
import '../../../data/bl_service/bl_my_info_service.dart';
import '../../../data/bl_untils/bl_loading.dart';
import '../../../routes/app_pages.dart';

class BlSplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // EasyLoading.show(status: "loading...");
    // Future.delayed(const Duration(seconds: 2), () {
    //   EasyLoading.dismiss();
    //   Get.offNamed(Routes.BL_LOGIN);
    // });
    getConfig();
  }



  // 获取config
  void getConfig() {
    BlHttpUtil().post<AppConfigEntityData>(BlHttpUrls.configApi, errCallback: (e) {
      BlLogger.debug("获取config error = ${e.message}");
      // AppLoading.toast(e.message);
      Future.delayed(const Duration(seconds: 2), () {
        getConfig();
      });
    }).then((value) {
      BlLogger.debug("获取config  = ${value.agoraAppId ?? ""}");
      AppMyInfoService.to.config = value;
      BlLogger.debug("获取authorization  = ${AppMyInfoService.to.authorization ?? ""}");
      if (AppMyInfoService.to.authorization?.isNotEmpty == true) {
        _getDetail();
      } else {
        Get.offAllNamed(Routes.BL_LOGIN);
      }
      // //  ios去获取追踪权限
      // AppAdjustManager.requestIosTracking();
    });
  }
}
// 拿到登录数据后先获取详情再去主页面
void whenGotLoginToMain(AppLoginEntity theLogin) {
  AppMyInfoService.to.setLoginData(theLogin);
  // //  ios去获取追踪权限
  // AppAdjustManager.requestIosTracking();
  _getDetail();
}

void _getDetail() {
  BlHttpUtil().post<AppInfoDetailEntity>(BlHttpUrls.userInfoApi, errCallback: (err) {
    BlLoading.toast(err.toString());
  }, showLoading: true).then((value) {
    getDetailToMain(value);
  });
}

// 获取详情再去主页面
void getDetailToMain(AppInfoDetailEntity value) {
  AppMyInfoService.to.requestLastDetailUserData(requestFinishCallBack: () {
    Get.offAllNamed(Routes.BL_MAIN);
  });
}