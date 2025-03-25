import '../../generated/json/app_login_entity.g.dart';
import '../../generated/json/base/json_field.dart';

@JsonSerializable()
class AppLoginEntity {
  AppLoginEntity();

  factory AppLoginEntity.fromJson(Map<String, dynamic> json) => $AppLoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppLoginEntityToJson(this);

  AppLoginEntityToken? token;
  String? enterTheSystem; //进入系统a或者b
  AppLoginEntityUser? user;
}

@JsonSerializable()
class AppLoginEntityToken {
  AppLoginEntityToken();

  factory AppLoginEntityToken.fromJson(Map<String, dynamic> json) => $AppLoginEntityTokenFromJson(json);

  Map<String, dynamic> toJson() => $AppLoginEntityTokenToJson(this);

  int? expire; //过期时间
  String? agoraToken; //声网token
  String? authorization; //系统token
  String? rtmToken; //rtm token
  String? userId;
  String? jpushAlias; //极光id
}

@JsonSerializable()
class AppLoginEntityUser {
  AppLoginEntityUser();

  factory AppLoginEntityUser.fromJson(Map<String, dynamic> json) => $AppLoginEntityUserFromJson(json);

  Map<String, dynamic> toJson() => $AppLoginEntityUserToJson(this);

  bool? accountNonExpired; //用户是否过期
  bool? accountNonLocked; //用户是否锁定
  List<dynamic>? authorities; //用户角色列表
  int? auth; //用户认证状态(主播使用)
  bool? credentialsNonExpired;
  String? userId;
  String? portrait;
  bool? enabled; //启用状态
  int? created; //1新用户 0老用户
  String? username; //用户名，用户id不显示给用户、显示这个
  String? nickname;
  int? gender;
  String? status; //账户状态 PROHIBIT：禁用   NORMAL：正常
  String? areaCode;
}
