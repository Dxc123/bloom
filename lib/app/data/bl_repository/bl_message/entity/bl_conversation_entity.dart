import 'package:isar/isar.dart';

part 'bl_conversation_entity.g.dart';

/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build
/// dart run build_runner build --delete-conflicting-outputs

@collection
class BlConversationDB {
  Id id = Isar.autoIncrement;
  @Index()
  String? myId; //当前用户的id

  @Index()
  String? anchorUserId; //对方 id

  @Index()
  String? conversationId; //会话唯一id 即是 conversationId

  @Index()
  int? createdAt;

  @Index()
  int? updatedAt;

  String? anchorAvatar; //主播头像
  String? anchorNickname; //主播昵称

  BlConversationDB({
    this.myId,
    this.anchorUserId,
    this.createdAt,
    this.updatedAt,
    this.anchorAvatar,
    this.anchorNickname,
  }) : conversationId = "${myId}_${anchorUserId}_$createdAt";
}
