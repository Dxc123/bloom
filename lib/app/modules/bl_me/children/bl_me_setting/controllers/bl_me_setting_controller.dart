import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:bloom/app/data/bl_untils/bl_storage.dart';
import 'package:get/get.dart';

import '../../../../../data/bl_api/bl_https.dart';
import '../../../../../data/bl_components/bl_log_out_dialog.dart';
import '../../../../../data/bl_service/bl_my_info_service.dart';
import '../../../../../data/bl_untils/bl_loading.dart';
import '../../../../../routes/app_pages.dart';

class BlMeSettingController extends GetxController {
  late List<String>  titlesList = [
    "Black List",
    "Resource Black List",
    "Feedback",
    "About",
    "Account cancellation",
    "My Publish",
  ];
  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    BlLogoutDialogView.show(
        type: BlDialogType.logout,
        callback: () async {
          await BlHttpUtil().post(BlHttpUrls.loginOutApi, errCallback: (err) {
            BlLogger.debug("退出登录失败error =$err");
            BlLoading.showToast(err.message);
          }, doneCallback: (bool success, String msg) {
            BlLogger.debug("退出成功");
            // if(AppMyInfoService.to.getUseQuickLogin()){
            //   AppMyInfoService.to.saveUseQuickLogin(false);
            // }
            AppMyInfoService.to.clear();
            BlStorage.write(AppMyInfoService.userLoginData, '');
            Get.offAllNamed(Routes.BL_LOGIN);
          }, showLoading: true);
        });
  }

  void onDeleteAccount() {
    BlLogoutDialogView.show(
        type: BlDialogType.cancellation,
        callback: () async {
          BlHttpUtil()
              .post(
            BlHttpUrls.deleteAccount,
            showLoading: true,
          )
              .then((value) async {
            BlLogger.debug("删除成功");
            // if(AppMyInfoService.to.getUseQuickLogin()){
            //   AppMyInfoService.to.saveUseQuickLogin(false);
            //   EasyLoading.show(status: 'Loading...');
            //   await Future.delayed(const Duration(seconds: 1));
            //   EasyLoading.dismiss();
            //   AppMyInfoService.to.clear();
            //   AppMyInfoService.to.prefs.setString(AppMyInfoService.userLoginData, '');
            //   Get.offAllNamed(Routes.HC_LOGIN);
            // }else{
            //
            // }
            await BlHttpUtil().post(BlHttpUrls.loginOutApi, errCallback: (err) {
              BlLoading.showToast(err.message);
            }, doneCallback: (bool success, String msg) {
              AppMyInfoService.to.clear();
              BlStorage.write(AppMyInfoService.userLoginData, '');
              Get.offAllNamed(Routes.BL_LOGIN);
            }, showLoading: true);


          });
        });
  }
}
