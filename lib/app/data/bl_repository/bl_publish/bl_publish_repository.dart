import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../bl_service/bl_my_info_service.dart';
import '../../bl_untils/bl_logger.dart';
import '../bl_repository_manager.dart';
import 'entity/bl_publish_media_entity.dart';

class BlPublishMediaRepository extends GetxController {
  static BlPublishMediaRepository get to => Get.find();

  Future<BlPublishMediaRepository> init() async {
    return this;
  }

  //当前用户的id
  static String get currentUserId => AppMyInfoService.to.myUserData?.username ?? "";

  //   *******************缓存发布动态数据****************//
  //   *******************缓存发布动态数据****************//
  //   *******************缓存发布动态数据****************//
  //   查找缓存的所有发布动态数据
  Future<List<BlPublishMediaEntity>?> findAllPublishMedia() async {
    List<BlPublishMediaEntity>? publishMedias = await BlRepositoryManager.to.isar.blPublishMediaEntitys.where().myIdEqualTo(currentUserId).findAll();
    return publishMedias;
  }

  //实时监听缓存的所有发布动态数据
  // Stream<List<BlPublishMediaEntity>?> watchAllPublishMedia() {
  //   return BlRepositoryManager.to.isar.BlPublishMediaEntitys.where().myIdEqualTo(currentUserId).watch(fireImmediately: true);
  // }
  StreamSubscription<List<BlPublishMediaEntity>> findAllPublishMediaStream({
    required Function(int, List<BlPublishMediaEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blPublishMediaEntitys.where().myIdEqualTo(currentUserId).watch(fireImmediately: true).listen((event) {
      BlLogger.debug("发布动态数据发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  //  缓存一条发布动态数据
  Future<void> insertOnePublishMedia({
    required BlPublishMediaEntity publishMedia,
    required VoidCallback callback,
  }) async {
    publishMedia.myId = currentUserId;
    await BlRepositoryManager.to.isar.writeTxn(() async {
      await BlRepositoryManager.to.isar.blPublishMediaEntitys.put(publishMedia);
    }).then((value) {
      BlLogger.debug("一条发布动态数据缓存成功");
      callback.call();
    });
  }

  //删除一条发布动态数据
  Future<void> deleteOnePublishMedia({
    required BlPublishMediaEntity publishMedia,
    required VoidCallback callback,
  }) async {
    await BlRepositoryManager.to.isar.writeTxn(() async {
      await BlRepositoryManager.to.isar.blPublishMediaEntitys.delete(publishMedia.id);
    }).then((value) {
      BlLogger.debug("一条发布动态数据删除成功");
      callback.call();
    });
  }
}
