import 'package:bloom/generated/json/base/json_convert_content.dart';
import 'package:bloom/app/data/bl_models/bl_base_data_entity.dart';

BlBaseEntity $BlBaseEntityFromJson(Map<String, dynamic> json) {
  final BlBaseEntity blBaseEntity = BlBaseEntity();
  final List<BlUserEntity>? userList = (json['userList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BlUserEntity>(e) as BlUserEntity).toList();
  if (userList != null) {
    blBaseEntity.userList = userList;
  }
  final List<BlFlowerEntity>? flowerList = (json['flowerList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BlFlowerEntity>(e) as BlFlowerEntity).toList();
  if (flowerList != null) {
    blBaseEntity.flowerList = flowerList;
  }
  return blBaseEntity;
}

Map<String, dynamic> $BlBaseEntityToJson(BlBaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userList'] = entity.userList?.map((v) => v.toJson()).toList();
  data['flowerList'] = entity.flowerList?.map((v) => v.toJson()).toList();
  return data;
}

extension BlBaseEntityExtension on BlBaseEntity {
  BlBaseEntity copyWith({
    List<BlUserEntity>? userList,
    List<BlFlowerEntity>? flowerList,
  }) {
    return BlBaseEntity()
      ..userList = userList ?? this.userList
      ..flowerList = flowerList ?? this.flowerList;
  }
}

BlUserEntity $BlUserEntityFromJson(Map<String, dynamic> json) {
  final BlUserEntity blUserEntity = BlUserEntity();
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    blUserEntity.userId = userId;
  }
  final String? homeCover = jsonConvert.convert<String>(json['homeCover']);
  if (homeCover != null) {
    blUserEntity.homeCover = homeCover;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    blUserEntity.title = title;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    blUserEntity.des = des;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    blUserEntity.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    blUserEntity.avatar = avatar;
  }
  final List<String>? picList = (json['picList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (picList != null) {
    blUserEntity.picList = picList;
  }
  final bool? isFollowed = jsonConvert.convert<bool>(json['isFollowed']);
  if (isFollowed != null) {
    blUserEntity.isFollowed = isFollowed;
  }
  final bool? isCollected = jsonConvert.convert<bool>(json['isCollected']);
  if (isCollected != null) {
    blUserEntity.isCollected = isCollected;
  }
  final bool? isLiked = jsonConvert.convert<bool>(json['isLiked']);
  if (isLiked != null) {
    blUserEntity.isLiked = isLiked;
  }
  final bool? isBlacked = jsonConvert.convert<bool>(json['isBlacked']);
  if (isBlacked != null) {
    blUserEntity.isBlacked = isBlacked;
  }
  final String? myId = jsonConvert.convert<String>(json['myId']);
  if (myId != null) {
    blUserEntity.myId = myId;
  }
  return blUserEntity;
}

Map<String, dynamic> $BlUserEntityToJson(BlUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['homeCover'] = entity.homeCover;
  data['title'] = entity.title;
  data['des'] = entity.des;
  data['nickName'] = entity.nickName;
  data['avatar'] = entity.avatar;
  data['picList'] = entity.picList;
  data['isFollowed'] = entity.isFollowed;
  data['isCollected'] = entity.isCollected;
  data['isLiked'] = entity.isLiked;
  data['isBlacked'] = entity.isBlacked;
  data['myId'] = entity.myId;
  return data;
}

extension BlUserEntityExtension on BlUserEntity {
  BlUserEntity copyWith({
    String? userId,
    String? homeCover,
    String? title,
    String? des,
    String? nickName,
    String? avatar,
    List<String>? picList,
    bool? isFollowed,
    bool? isCollected,
    bool? isLiked,
    bool? isBlacked,
    String? myId,
  }) {
    return BlUserEntity()
      ..userId = userId ?? this.userId
      ..homeCover = homeCover ?? this.homeCover
      ..title = title ?? this.title
      ..des = des ?? this.des
      ..nickName = nickName ?? this.nickName
      ..avatar = avatar ?? this.avatar
      ..picList = picList ?? this.picList
      ..isFollowed = isFollowed ?? this.isFollowed
      ..isCollected = isCollected ?? this.isCollected
      ..isLiked = isLiked ?? this.isLiked
      ..isBlacked = isBlacked ?? this.isBlacked
      ..myId = myId ?? this.myId;
  }
}

BlFlowerEntity $BlFlowerEntityFromJson(Map<String, dynamic> json) {
  final BlFlowerEntity blFlowerEntity = BlFlowerEntity();
  final String? flowerId = jsonConvert.convert<String>(json['flowerId']);
  if (flowerId != null) {
    blFlowerEntity.flowerId = flowerId;
  }
  final String? homeCover = jsonConvert.convert<String>(json['homeCover']);
  if (homeCover != null) {
    blFlowerEntity.homeCover = homeCover;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    blFlowerEntity.title = title;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    blFlowerEntity.des = des;
  }
  final List<String>? picList = (json['picList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (picList != null) {
    blFlowerEntity.picList = picList;
  }
  final bool? isFollowed = jsonConvert.convert<bool>(json['isFollowed']);
  if (isFollowed != null) {
    blFlowerEntity.isFollowed = isFollowed;
  }
  final bool? isCollected = jsonConvert.convert<bool>(json['isCollected']);
  if (isCollected != null) {
    blFlowerEntity.isCollected = isCollected;
  }
  final bool? isLiked = jsonConvert.convert<bool>(json['isLiked']);
  if (isLiked != null) {
    blFlowerEntity.isLiked = isLiked;
  }
  final bool? isBlacked = jsonConvert.convert<bool>(json['isBlacked']);
  if (isBlacked != null) {
    blFlowerEntity.isBlacked = isBlacked;
  }
  final String? myId = jsonConvert.convert<String>(json['myId']);
  if (myId != null) {
    blFlowerEntity.myId = myId;
  }
  return blFlowerEntity;
}

Map<String, dynamic> $BlFlowerEntityToJson(BlFlowerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['flowerId'] = entity.flowerId;
  data['homeCover'] = entity.homeCover;
  data['title'] = entity.title;
  data['des'] = entity.des;
  data['picList'] = entity.picList;
  data['isFollowed'] = entity.isFollowed;
  data['isCollected'] = entity.isCollected;
  data['isLiked'] = entity.isLiked;
  data['isBlacked'] = entity.isBlacked;
  data['myId'] = entity.myId;
  return data;
}

extension BlFlowerEntityExtension on BlFlowerEntity {
  BlFlowerEntity copyWith({
    String? flowerId,
    String? homeCover,
    String? title,
    String? des,
    List<String>? picList,
    bool? isFollowed,
    bool? isCollected,
    bool? isLiked,
    bool? isBlacked,
    String? myId,
  }) {
    return BlFlowerEntity()
      ..flowerId = flowerId ?? this.flowerId
      ..homeCover = homeCover ?? this.homeCover
      ..title = title ?? this.title
      ..des = des ?? this.des
      ..picList = picList ?? this.picList
      ..isFollowed = isFollowed ?? this.isFollowed
      ..isCollected = isCollected ?? this.isCollected
      ..isLiked = isLiked ?? this.isLiked
      ..isBlacked = isBlacked ?? this.isBlacked
      ..myId = myId ?? this.myId;
  }
}