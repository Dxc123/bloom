import 'dart:convert';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:get/get.dart';

import '../../../bl_app/models/app_config_entity.dart';
import '../../../bl_app/models/app_info_entity.dart';
import '../../../bl_app/models/app_login_entity.dart';
import '../../../generated/json/base/json_convert_content.dart';
import '../bl_api/bl_https.dart';
import '../bl_common/bl_constants.dart';
import '../bl_untils/bl_storage.dart';

class AppMyInfoService extends GetxService {
  static AppMyInfoService get to => Get.find();

  //登录信息//////////////
  static const userLoginData = 'userLoginData';
  AppConfigEntityData? config; //app config信息
  AppLoginEntityUser? userLogin;
  AppLoginEntityToken? token;
  String? enterTheSystem;
  String? authorization;

  Future<AppMyInfoService> init() async {
    _setupCacheConfigInfo();
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

  
  void clear() {
    authorization = null;
    // config = null;
    token = null;
    enterTheSystem = null;
    userLogin = null;
  }

  //设置缓存的 config信息
  void _setupCacheConfigInfo() {
    String userLoginDataStr = BlStorage.read(userLoginData) ?? "";
    // BlLogger.debug("userLoginData =  $userLoginDataStr");
    if (userLoginDataStr.isNotEmpty) {
      try {
        AppLoginEntity login = JsonConvert.fromJsonAsT<AppLoginEntity>(jsonDecode(userLoginDataStr))!;
        setLoginData(login);
      } catch (e) {
        BlLogger.debug("JsonConvert 错误 e= $e");
      }
    }
  }

  // 登录后设置这个登录信息
  void setLoginData(AppLoginEntity theLogin) async{
    token = theLogin.token;
    enterTheSystem = theLogin.enterTheSystem;
    userLogin = theLogin.user;
    authorization = token?.authorization;
    // BlLogger.debug("authorization = $authorization");
    String str = jsonEncode(theLogin.toJson());
   await BlStorage.write(userLoginData, str);
  }



  /// 用户信息相关相关/////////////////////////
  //用于监听
  final _userDetail = AppInfoDetailEntity().obs;

  /// 直接获取最近一次的用户详细信息
  AppInfoDetailEntity? get myUserData {
    return _userDetail.value;
  }

  /// 获取用户基本信息 无则请求 有则直接返回最近一次的缓存信息
  Future<AppInfoDetailEntity?> get detailUserData async {
    if (myUserData?.userId == null) {
      await BlHttpUtil().post<AppInfoDetailEntity>(BlHttpUrls.userInfoApi, showLoading: false, errCallback: (err) {}).then((value) {
        BlLogger.debug("获取个人详细信息username= ${value.username ?? 0}");
        _userDetail.value = value;
      });
      return myUserData;
    }
    return myUserData;
  }

  /// 获取最新一次的用户详细信息
  void requestLastDetailUserData({bool showLoading = false, Function? requestFinishCallBack}) {
    BlHttpUtil().post<AppInfoDetailEntity>(BlHttpUrls.userInfoApi, showLoading: false, errCallback: (err) {
      requestFinishCallBack?.call();
    }).then((value) {
      BlLogger.debug("获取个人详细信息username= ${value.username ?? 0}");
      _userDetail.value = value;
      requestFinishCallBack?.call();
    });
  }

  /// 获取用户余额
  int get remainDiamonds {
    return myUserData?.userBalance?.remainDiamonds ?? 0;
  }

  /// 获取用户总充值数
  int get totalRecharge {
    return myUserData?.userBalance?.totalRecharge ?? 0;
  }

  /// 获取用户充值的等级
  int get rechargeLevel {
    return myUserData?.userBalance?.userLevel ?? 0;
  }
  
  
}
