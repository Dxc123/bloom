import 'package:hive/hive.dart';

part 'user_info_hive_entity.g.dart'; //一定要注意，跟实体名称一致

@HiveType(typeId: 0)
class UserInfoHiveEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;

  UserInfoHiveEntity({
    required this.id,
    required this.name,
    required this.age,
  });
}
