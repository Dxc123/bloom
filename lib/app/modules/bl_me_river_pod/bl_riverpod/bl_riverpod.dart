
import 'package:flutter_riverpod/flutter_riverpod.dart';
import'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../bl_app/models/app_info_entity.dart';
import '../../../data/bl_api/bl_https.dart';
import '../../../data/bl_untils/bl_logger.dart';
part 'bl_riverpod.g.dart';

@Riverpod(keepAlive: true)
BlRiverpod blRiverpod(Ref ref) {
  return BlRiverpod();
}

class BlRiverpod{
   int getImageCount(){
    return 0;
  }

   /// 用户信息相关相关/////////////////////////
   //用于监听
   var _userDetail = AppInfoDetailEntity();

   /// getter
   AppInfoDetailEntity? get myUserData {
     return _userDetail;
   }

   // setter
   set myUserData(AppInfoDetailEntity? value) {
     _userDetail = value ?? AppInfoDetailEntity();
   }


   /// 获取用户基本信息 无则请求 有则直接返回最近一次的缓存信息
   Future<AppInfoDetailEntity?> getMyUserData() async {
     if (myUserData?.userId == null) {
       await BlHttpUtil().post<AppInfoDetailEntity>(BlHttpUrls.userInfoApi, showLoading: false, errCallback: (err) {}).then((value) {
         BlLogger.debug("获取个人详细信息username= ${value.username ?? 0}");
         _userDetail = value;
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
       _userDetail = value;
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



@Riverpod(keepAlive: true)
class UserInfoService extends _$UserInfoService {
  @override
  FutureOr<AppInfoDetailEntity> build() async{
    final userInfo = await ref.read(blRiverpodProvider).getMyUserData() ?? AppInfoDetailEntity();
    return userInfo;
  }
}