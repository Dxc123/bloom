import 'package:isar/isar.dart';

part 'bl_flower_db_entity.g.dart';

/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build
/// dart run build_runner build --delete-conflicting-outputs

@collection
class BlFlowerDbEntity {
  Id id = Isar.autoIncrement;
  @Index()
  String? myId; //我的id
  int? createdAt= DateTime.now().millisecondsSinceEpoch;

  int? updatedAt = DateTime.now().millisecondsSinceEpoch;

  String? flowerId;
  String? homeCover;
  String? title;
  String? des;
  List<String>? picList;

  // 是否关注
  bool? isFollowed;

// 是否收藏
  bool? isCollected;

  // 是否喜欢
  bool? isLiked;

  // 是否被拉黑
  bool? isBlacked;

  Recepient? recipient;

  BlFlowerDbEntity({
    this.myId,
    this.createdAt,
    this.updatedAt,
    this.flowerId,
    this.homeCover,
    this.title,
    this.des,
    this.picList,
    this.isFollowed = false,
    this.isCollected = false,
    this.isLiked = false,
    this.isBlacked = false,
    this.recipient,
  });
}

//嵌套对象
@embedded
class Recepient {
  String? name;
  String? address;
}
