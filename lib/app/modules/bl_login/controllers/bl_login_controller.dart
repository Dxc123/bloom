import 'dart:math';

import 'package:bloom/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../bl_app/models/app_login_entity.dart';
import '../../../data/bl_api/bl_https.dart';
import '../../../data/bl_common/bl_constants.dart';
import '../../../data/bl_components/bl_login_agree_dialog.dart';
import '../../../data/bl_service/bl_my_info_service.dart';
import '../../../data/bl_untils/bl_loading.dart';
import '../../../data/bl_untils/bl_storage.dart';
import '../../bl_splash/controllers/bl_splash_controller.dart';
import '../views/bl_login_until.dart';

class BlLoginController extends GetxController {
  final TextEditingController textEditingController = TextEditingController(
    text: BlStorage.read("test_google_id"),
  );
  bool _loading = false;
  AppLoginUtil loginUtil = AppLoginUtil();

  // 用来获取随机头像 ，后端会拼上域名
  static const _heads = [
    //服务端给的默认.png格式
    "users/awss3/manage/upload/default1.png",
    "users/awss3/manage/upload/default2.png",
    "users/awss3/manage/upload/default3.png",
    "users/awss3/manage/upload/default4.png",
    "users/awss3/manage/upload/default5.png",
  ];

  // 用来获取随机名字
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  final Random _rnd = Random();

  String _getRandomString(int length) {
    return String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  @override
  void onInit() {
    super.onInit();
    AppMyInfoService.to.agree.value = AppMyInfoService.to.getAgreementStatus();
  }


  /// 测试登录
  void testLoginGoogle(String str) {
    BlStorage.write("test_google_id", str);
    if (AppMyInfoService.to.agree.value == false) {
      BlLoginAgreeDialog.show(onAgree: () {
        _loginGoogle(
          token: '',
          id: str,
          nickname: _getRandomString(5),
          cover: _heads[_rnd.nextInt(5)],
          email: '',
        );
      });
      return;
    } else {
      _loginGoogle(
        token: '',
        id: str,
        nickname: _getRandomString(5),
        cover: _heads[_rnd.nextInt(5)],
        email: '',
      );
    }
  }

  void googleSignIn() {
    if (_loading) {
      return;
    }
    _loading = true;
    loginUtil.googleSignIn((callback) {
      if (callback.success) {
        _loginGoogle(
          token: callback.token,
          id: callback.id,
          nickname: callback.nickname,
          cover: callback.cover,
          email: callback.email,
        );
      }
      _loading = false;
    });
  }

  void _loginGoogle({
    required String? token,
    required String id,
    required String? nickname,
    required String? cover,
    required String? email,
  }) {
    var config = BlHttpUtil().post<AppLoginEntity>(BlHttpUrls.googleLoginApi, data: {
      "id": id,
      "cover": cover ?? _heads[_rnd.nextInt(5)],
      "token": token ?? "",
      "nickname": nickname ?? "${BlConstants.appNameLower}_${_getRandomString(5)}",
    }, errCallback: (err) {
      BlLoading.toast(err.toString());
    }, doneCallback: (success, re) {
      _loading = false;
    }, showLoading: true);
    config.then((value) {
      whenGotLoginToMain(value);
    });
  }

  void appleSignIn() {
    if (_loading) {
      return;
    }
    _loading = true;
    loginUtil.appleSignIn((callback) {
      if (callback.success) {
        _loginApple(callback.token, callback.nickname);
      }
      _loading = false;
    });
  }

  void _loginApple(String? token, String? nickname) {
    var config = BlHttpUtil().post<AppLoginEntity>(BlHttpUrls.appleLoginApi, data: {
      "identityToken": token ?? "",
      // 苹果登录nickName 字段是大写
      "nickName": nickname ?? "${BlConstants.appNameLower}_${_getRandomString(5)}",
    }, errCallback: (err) {
      BlLoading.toast(err.toString());
    }, doneCallback: (success, re) {
      _loading = false;
    }, showLoading: true);
    config.then((value) {
      whenGotLoginToMain(value);
    });
  }
}
