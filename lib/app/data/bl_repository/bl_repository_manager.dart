import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

// import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'bl_media/bl_media_repository.dart';
import 'bl_media/entity/bl_flower_db_entity.dart';
import 'bl_media/entity/bl_user_db_entity.dart';
import 'bl_message/bl_message_repository.dart';
import 'bl_publish/bl_publish_repository.dart';
import 'bl_message/entity/bl_conversation_entity.dart';
import 'bl_message/entity/bl_message_entity.dart';
import 'bl_publish/entity/bl_publish_media_entity.dart';

class BlRepositoryManager extends GetxController {
  static BlRepositoryManager get to => Get.find();

  late Isar isar;

  // late final WiBoxStore objectBox;

  ///////

  // 初始化 Isar
  Future<BlRepositoryManager> init() async {
    // await WiStorageUntil.initStorage();
    isar = await _openDB();
    // final store = await openStore(
    //   directory: p.join((await getApplicationDocumentsDirectory()).path, "obx_Repository"),
    //   macosApplicationGroup: "objectBox.media",
    // );
    // objectBox = await WiBoxStore.create(store);
    await Get.putAsync<BlPublishMediaRepository>(() => BlPublishMediaRepository().init());
    await Get.putAsync<BlMessageRepository>(() => BlMessageRepository().init());
    await Get.putAsync<BlMediaRepository>(() => BlMediaRepository().init());
    return this;
  }

  // 获取 Isar 实例
  Future<Isar> _openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        BlPublishMediaEntitySchema,
        BlConversationDBSchema,
        BlMessageDBSchema,
        BlFlowerDbEntitySchema,
        BlUserDbEntitySchema,
      ],
      directory: dir.path,
      inspector: kDebugMode,
    );
    return isar;
  }
}
