import 'package:hive_flutter/hive_flutter.dart';

import 'entity/user_info_hive_entity.dart';

class BlHive{
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserInfoHiveEntityAdapter());
    await Hive.openBox<UserInfoHiveEntity>('bl_user');
  }


  static  final Box<UserInfoHiveEntity> _cartBox = Hive.box<UserInfoHiveEntity>('bl_user');

//插入一条数据
  static Future<void> insertUserInfo(UserInfoHiveEntity userInfoHiveEntity) async {
    // 检查缓存中是否已存在
    final existingItemIndex = _cartBox.values.toList().indexWhere(
          (item) => item.id == userInfoHiveEntity.id,
    );

    if (existingItemIndex != -1) {

    } else {

    }
  }

//   删除一条数据
  static Future<void> deleteUserInfo(UserInfoHiveEntity userInfoHiveEntity) async {
    await _cartBox.delete(userInfoHiveEntity.id);
  }

//  更新一条数据
  static Future<void> updateUserInfo(UserInfoHiveEntity userInfoHiveEntity) async {
    await _cartBox.put(userInfoHiveEntity.id, userInfoHiveEntity);
  }

//   获取一条数据
  static Future<UserInfoHiveEntity?> getUserInfo(String id) async {
    return _cartBox.get(id);
  }

}