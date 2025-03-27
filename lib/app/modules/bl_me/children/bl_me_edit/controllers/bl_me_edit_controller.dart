import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:get/get.dart';

import '../../../../../data/bl_api/bl_https.dart';
import '../../../../../data/bl_components/bl_choose_image_until.dart';
import '../../../../../data/bl_components/bl_edit_bitthday_dialog.dart';
import '../../../../../data/bl_components/bl_edit_name_dalog.dart';
import '../../../../../data/bl_components/bl_edit_sex_dialog.dart';
import '../../../../../data/bl_service/bl_my_info_service.dart';
import '../../../../../data/bl_untils/bl_loading.dart';

class BlMeEditController extends GetxController {
  final titlesList = [
    "",
    "NickName",
    "birthday",
  ];

  void onChangeAvatar() {
    BlChooseImageUtil(
        type: 0,
        callBack: (uploader, type, url, path) {
          switch (type) {
            case UploadMediaType.cancel:
              {}
              break;
            case UploadMediaType.begin:
              BlLoading.showLoading();
              break;
            case UploadMediaType.success:
              BlLoading.dismiss();
              BlHttpUtil()
                  .post<void>(
                BlHttpUrls.updateUserInfoApi,
                data: {"portrait": url},
                showLoading: true,
              )
                  .then((value) {
                AppMyInfoService.to.requestLastDetailUserData();
              });
              break;
            case UploadMediaType.failed:
              BlLoading.dismiss();
              break;
          }
        }).openChooseDialog();
  }

  void onChangeName() {
    BlEditNameDialogView.showDialog(
        nickName: AppMyInfoService.to.myUserData?.nickname ?? "",
        callback: (nickName) {
          if (nickName.isNotEmpty) {
            BlLogger.debug("去除尾部的空格符");
            String finalS = nickName.replaceAll(RegExp(r'\s*$'), "");
            finalS = finalS.replaceAll(RegExp(r"\d"), "*");
            BlLoading.showLoading();
            BlHttpUtil().post<void>(BlHttpUrls.updateUserInfoApi, data: {"nickname": finalS}, errCallback: (e) {
              BlLoading.dismiss();
            }).then((value) {
              AppMyInfoService.to.requestLastDetailUserData();
              BlLoading.dismiss();
            });
          } else {
            BlLoading.toast("You haven't entered anything yet");
          }
        });
  }

  void oChangeGender() {
    BlEditSexDialog.showDialog(
        sex: AppMyInfoService.to.myUserData?.gender ?? 0,
        callback: (gender) {
          BlLoading.showLoading();
          BlHttpUtil().post<void>(BlHttpUrls.updateUserInfoApi, data: {"gender": gender}, errCallback: (e) {
            BlLoading.dismiss();
          }).then((value) {
            AppMyInfoService.to.requestLastDetailUserData();
            BlLoading.dismiss();
          });
        });
  }

  void onChangeBirthday() {
    BlEditBirthdayDialog.showDialog(
        birthday: AppMyInfoService.to.myUserData?.birthday ?? 0,
        callback: (birthday) {
          BlLoading.showLoading();
          BlHttpUtil().post<void>(BlHttpUrls.updateUserInfoApi, data: {"birthday": birthday}, errCallback: (e) {
            BlLoading.dismiss();
          }).then((value) {
            AppMyInfoService.to.requestLastDetailUserData();
            BlLoading.dismiss();
          });
        });
  }
}