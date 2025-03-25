import 'package:isar/isar.dart';
part 'bl_message_entity.g.dart';

/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build
/// dart run build_runner build --delete-conflicting-outputs

@collection
class BlMessageDB {
  Id id = Isar.autoIncrement;
  @Index()
  String? myId; //当前用户的id

  @Index()
  int? conversationId; // 会话id 关联会话

  String? sendUserId; // 发送消息一方的id
  String? receivedUserId; //接受消息一方的id

  @Index()
  int? createdAt = DateTime.now().millisecondsSinceEpoch; // 创建时间
  @Index()
  int? updatedAt;

  String? msgContent; //消息数据

  @Enumerated(EnumType.name)
  MsgTypeEnum? msgType; //消息类型

  String? text; //文本消息内容

  @Index()
  int? hasRead; // 消息是否已读 0未读 1已读
}

enum MsgTypeEnum { text, gift }
