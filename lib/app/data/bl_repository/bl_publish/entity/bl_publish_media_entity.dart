import 'package:isar/isar.dart';

part 'bl_publish_media_entity.g.dart';

/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build
/// dart run build_runner build --delete-conflicting-outputs

@collection
class BlPublishMediaEntity {
  Id id = Isar.autoIncrement;
  @Index()
  String? myId; //我的id
  int? createdAt = DateTime.now().millisecondsSinceEpoch;
  int? updatedAt = DateTime.now().millisecondsSinceEpoch;

  String? title;
  String? content;
  List<String>? picList;
}
