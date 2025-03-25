import 'dart:async';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../bl_models/bl_base_data_entity.dart';
import '../../bl_service/bl_my_info_service.dart';
import '../bl_repository_manager.dart';
import 'entity/bl_flower_db_entity.dart';
import 'entity/bl_user_db_entity.dart';

class BlMediaRepository extends GetxController {
  static BlMediaRepository get to => Get.find();

  Future<BlMediaRepository> init() async {
    return this;
  }

  //当前用户的id
  static String get currentUserId => AppMyInfoService.to.myUserData?.username ?? "";

  //   *******************缓存首页Flowers列表数据****************//
  //   *******************缓存首页Flowers列表数据****************//
  //   *******************缓存首页Flowers列表数据****************//
  // BlFlowerDbEntity
  //   查找缓存的所有Flowers数据
  Future<List<BlFlowerDbEntity>?> findAllFlowerMedia() async {
    List<BlFlowerDbEntity>? flowerMedias = await BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().isBlackedEqualTo(false).findAll();
    return flowerMedias;
  }

//  实时监听缓存的所有Flowers数据
  StreamSubscription<List<BlFlowerDbEntity>> findAllFlowerMediaStream({
    required Function(int, List<BlFlowerDbEntity>) callback,
  }) {
    Stream<List<BlFlowerDbEntity>> stream = BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).watch(fireImmediately: true);
    return stream.listen((event) {
      BlLogger.debug("Flowers数据发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  //查找缓存的一条Flowers数据
  Future<BlFlowerDbEntity?> findOneFlowerMedia({required String flowerId}) async {
    BlFlowerDbEntity? flowerMedia = await BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().flowerIdEqualTo(flowerId).findFirst();
    return flowerMedia;
  }

  // 插入一条Flowers数据
  Future<void> insertOneFlowerMedia({
    required BlFlowerEntity flowerMedia,
    required Function callback,
  }) async {
    BlFlowerDbEntity? cacheFlowerMedia = await findOneFlowerMedia(flowerId: flowerMedia.flowerId ?? "");
    if (cacheFlowerMedia != null) {
      BlLogger.debug("有缓存数据");
      // cacheFlowerMedia
      //   ..myId = currentUserId
      //   ..flowerId = flowerMedia.flowerId
      //   ..type = flowerMedia.type
      //   ..score = flowerMedia.score
      //   ..title = flowerMedia.title
      //   ..des = flowerMedia.des
      //   ..picList = flowerMedia.picList
      //   ..isFollowed = flowerMedia.isFollowed
      //   ..isCollected = flowerMedia.isCollected
      //   ..isLiked = flowerMedia.isLiked
      //   ..isBlacked = flowerMedia.isBlacked;
      callback.call();
    } else {
      BlLogger.debug("新增缓存数据");
      cacheFlowerMedia = BlFlowerDbEntity()
        ..myId = currentUserId
        ..flowerId = flowerMedia.flowerId
        ..title = flowerMedia.title
        ..des = flowerMedia.des
        ..picList = flowerMedia.picList
        ..isFollowed = flowerMedia.isFollowed
        ..isCollected = flowerMedia.isCollected
        ..isLiked = flowerMedia.isLiked
        ..isBlacked = flowerMedia.isBlacked;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blFlowerDbEntitys.put(cacheFlowerMedia!);
      }).then((value) {
        BlLogger.debug("一条数据插入完成 flowerId ${flowerMedia.flowerId ?? ""}");
        callback.call();
      });
    }
  }

  // 批量缓存Flowers数据
  Future<void> insertFlowerMedias({
    required List<BlFlowerEntity> list,
    required Function callback,
  }) async {
    List<BlFlowerDbEntity> dbList = list
        .map((e) => BlFlowerDbEntity()
          ..myId = currentUserId
          ..flowerId = e.flowerId
          ..homeCover = e.homeCover
          ..title = e.title
          ..des = e.des
          ..picList = e.picList
          ..isFollowed = e.isFollowed
          ..isCollected = e.isCollected
          ..isLiked = e.isLiked
          ..isBlacked = e.isBlacked)
        .toList();
    BlLogger.debug("dbList = ${dbList.length}");
    for (var media in dbList) {
      await _addOneFlowerMedia(flowerMedia: media, callback: () {});
    }
  }

  Future<void> _addOneFlowerMedia({
    required BlFlowerDbEntity flowerMedia,
    required Function callback,
  }) async {
    BlFlowerDbEntity? cacheFlowerMedia = await findOneFlowerMedia(flowerId: flowerMedia.flowerId ?? "");
    if (cacheFlowerMedia != null) {
      BlLogger.debug("有缓存数据");
      callback.call();
    } else {
      BlLogger.debug("新增缓存数据");
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blFlowerDbEntitys.put(flowerMedia);
      }).then((value) {
        BlLogger.debug("一条数据插入完成 flowerId ${flowerMedia.flowerId ?? ""}");
        callback.call();
      });
    }
  }

  // 删除一条Flowers数据
  Future<void> deleteOneFlowerMedia({
    required String flowerId,
    required Function callback,
  }) async {
    BlFlowerDbEntity? flowerMedia = await findOneFlowerMedia(flowerId: flowerId);
    if (flowerMedia?.id != null) {
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blFlowerDbEntitys.delete(flowerMedia!.id);
      }).then((value) {
        BlLogger.debug("一条数据删除完成 flowerId ${flowerMedia?.flowerId ?? ""}");
        callback.call();
      });
    }
  }

  // 拉黑

  // 是否拉黑了某一条Flowers数据
  bool findBlackedOneFlowerMedia({required String flowerId}) {
    BlFlowerDbEntity? flowerMedia = BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().flowerIdEqualTo(flowerId).findFirstSync();
    return flowerMedia?.isBlacked ?? false;
  }

  //根据isBlacked 更新是否拉黑一条Flowers数据
  Future<void> updateIsBlackedOneFlowerMedia({
    required String flowerId,
    required bool isBlacked,
    required Function callback,
  }) async {
    BlFlowerDbEntity? flowerMedia = await findOneFlowerMedia(flowerId: flowerId);
    if (flowerMedia != null) {
      flowerMedia.isBlacked = isBlacked;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blFlowerDbEntitys.put(flowerMedia);
      }).then((value) {
        BlLogger.debug("一条数据更新完成 flowerId ${flowerMedia.flowerId ?? ""}");
        callback.call();
      });
    }
  }

  // 查找所有拉黑的Flowers数据
  Future<List<BlFlowerDbEntity>?> findAllBlackedFlowerMedia() async {
    List<BlFlowerDbEntity>? flowerMedias = await BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().isBlackedEqualTo(true).findAll();
    return flowerMedias;
  }

  // 实时监听所有拉黑的Flowers数据
  StreamSubscription<List<BlFlowerDbEntity>> findAllBlackedFlowerMediaStream({
    required Function(int, List<BlFlowerDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().isBlackedEqualTo(true).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("拉黑的Flowers数据发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  // 收藏

  // 是否收藏了某一条Flowers数据
  bool findCollectedOneFlowerMedia({required String flowerId}) {
    BlFlowerDbEntity? flowerMedia = BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().flowerIdEqualTo(flowerId).findFirstSync();
    return flowerMedia?.isCollected ?? false;
  }

  //根据isCollected 更新是否收藏一条Flowers数据
  Future<void> updateIsCollectedOneFlowerMedia({
    required String flowerId,
    required bool isCollected,
    required Function callback,
  }) async {
    BlFlowerDbEntity? flowerMedia = await findOneFlowerMedia(flowerId: flowerId);
    if (flowerMedia != null) {
      flowerMedia.isCollected = isCollected;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blFlowerDbEntitys.put(flowerMedia);
      }).then((value) {
        BlLogger.debug("一条数据isCollected更新完成 flowerId ${flowerMedia.flowerId ?? ""}");
        callback.call();
      });
    }
  }

  // 查找所有收藏的Flowers数据
  Future<List<BlFlowerDbEntity>?> findAllCollectedFlowerMedia() async {
    List<BlFlowerDbEntity>? flowerMedias = await BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().isCollectedEqualTo(true).isBlackedEqualTo(false).findAll();
    return flowerMedias;
  }

  // 实时监听所有收藏的Flowers数据
  StreamSubscription<List<BlFlowerDbEntity>> findAllCollectedFlowerMediaStream({
    required Function(int, List<BlFlowerDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blFlowerDbEntitys.where().myIdEqualTo(currentUserId).filter().isCollectedEqualTo(true).isBlackedEqualTo(false).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("收藏的Flowers数据发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  //   *******************缓存用户数据(收藏、点赞、黑名单等一份缓存统一处理)****************//
  //   *******************缓存用户数据(收藏、点赞、黑名单等一份缓存统一处理)****************//
  //   *******************缓存用户数据(收藏、点赞、黑名单等一份缓存统一处理)****************//

  //缓存一条主播数据
  Future<void> insertOneAnchor({
    required BlUserEntity user,
    required Function callback,
  }) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: user.userId ?? "");
    if (anchor != null) {
      BlLogger.debug("cache缓存anchor = $anchor \n user.userId = ${user.userId ?? ""}");
      // BlLogger.debug("更新缓存数据");
      callback.call();
    } else {
      BlLogger.debug("新增缓存数据");
      anchor = BlUserDbEntity()
        ..myId = currentUserId
        ..userId = user.userId
        ..nickName = user.nickName
        ..avatar = user.avatar
        ..avatar = user.avatar
        ..homeCover = user.homeCover
        ..title = user.title
        ..des = user.des
        ..picList = user.picList
        ..isFollowed = user.isFollowed
        ..isCollected = user.isCollected
        ..isLiked = user.isLiked
        ..isBlacked = user.isBlacked;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor!);
      }).then((value) {
        BlLogger.debug("一条数据新增完成 userId ${anchor?.userId ?? ""}");
        callback.call();
      });
    }
  }

  // 批量缓存主播数据
  Future<void> insertAllAnchor({
    required List<BlUserEntity> list,
    required Function callback,
  }) async {
    List<BlUserDbEntity> dbList = list
        .map((e) => BlUserDbEntity()
          ..myId = currentUserId
          ..userId = e.userId
          ..nickName = e.nickName
          ..avatar = e.avatar
          ..avatar = e.avatar
          ..homeCover = e.homeCover
          ..title = e.title
          ..des = e.des
          ..picList = e.picList
          ..isFollowed = e.isFollowed
          ..isCollected = e.isCollected
          ..isLiked = e.isLiked
          ..isBlacked = e.isBlacked)
        .toList();
    BlLogger.debug("dbList = ${dbList.length}");
    for (var media in dbList) {
      await _addOneAnchor(anchor: media, callback: () {});
    }
  }

  Future<void> _addOneAnchor({
    required BlUserDbEntity anchor,
    required Function callback,
  }) async {
    BlUserDbEntity? cacheAnchor = await findOneAnchor(userId: anchor.userId ?? "");
    if (cacheAnchor != null) {
      BlLogger.debug("有缓存数据");
      callback.call();
    } else {
      BlLogger.debug("新增缓存数据");
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor);
      }).then((value) {
        BlLogger.debug("一条数据新增完成 userId ${anchor.userId ?? ""}");
        callback.call();
      });
    }
  }

  // 更新一条主播数据
  Future<void> updateOneAnchor({
    required BlUserEntity user,
    required Function callback,
  }) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: user.userId ?? "");
    BlLogger.debug("cache缓存anchor = $anchor \n user.userId = ${user.userId ?? ""}");
    if (anchor != null) {
      BlLogger.debug("更新缓存数据");
      anchor
        ..myId = currentUserId
        ..userId = user.userId
        ..nickName = user.nickName
        ..avatar = user.avatar
        ..homeCover = user.homeCover
        ..title = user.title
        ..des = user.des
        ..picList = user.picList
        ..isFollowed = user.isFollowed
        ..isCollected = user.isCollected
        ..isLiked = user.isLiked
        ..isBlacked = user.isBlacked;
    }
    await BlRepositoryManager.to.isar.writeTxn(() async {
      await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor!);
    }).then((value) {
      BlLogger.debug("一条数据更新完成 userId ${anchor?.userId ?? ""}");
      callback.call();
    });
  }

  /////////////////////////////////////////
  //   删除一条主播缓存数据
  Future<void> deleteOneAnchor({
    required String userId,
    required Function callback,
  }) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: userId);
    if (anchor?.id != null) {
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.delete(anchor!.id);
      }).then((value) {
        BlLogger.debug("一条数据删除完成 userId ${anchor?.userId ?? ""}");
        callback.call();
      });
    }
  }

  /////////////////////////////////////////
  // 查找某个主播的缓存记录
  Future<BlUserDbEntity?> findOneAnchor({required String userId}) async {
    BlUserDbEntity? anchor = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().userIdEqualTo(userId).findFirst();
    return anchor;
  }

  // 查找缓存的所有主播数据
  Future<List<BlUserDbEntity>?> findAllAnchor() async {
    List<BlUserDbEntity>? anchors = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isBlackedEqualTo(false).findAll();
    return anchors;
  }

//实时监听缓存的所有主播变化
  StreamSubscription<List<BlUserDbEntity>> findAllAnchorStream({
    required Function(int, List<BlUserDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("缓存的主播发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  /////////点赞相关

//   查找缓存的所有主播中的点赞数据
  Future<List<BlUserDbEntity>?> findAllLikedAnchor() async {
    List<BlUserDbEntity>? anchors = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isLikedEqualTo(true).isBlackedEqualTo(false).findAll();
    return anchors;
  }

  // 实时监听缓存的所有主播中点赞数据的数量变化
  StreamSubscription<List<BlUserDbEntity>> findAllLikedAnchorCountStream({
    required Function(int, List<BlUserDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isLikedEqualTo(true).isBlackedEqualTo(false).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("点赞主播发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  //   查找是否点赞某个主播 isLiked
  bool findLikedOneAnchor({required String userId}) {
    BlUserDbEntity? anchor = BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().userIdEqualTo(userId).findFirstSync();
    return anchor?.isLiked ?? false;
  }

  //   更新某个主播的点赞状态
  Future<void> updateIsLikedOneAnchor({required String userId, required bool isLiked, required Function callback}) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: userId);
    if (anchor != null) {
      anchor.isLiked = isLiked;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor);
      }).then((value) {
        BlLogger.debug("更新点赞状态成功 userId = $userId");
        callback.call();
      });
    } else {
      BlLogger.debug("更新点赞状态失败 userId = $userId");
    }
  }

/////////收藏相关
//   查找缓存的所有主播中的收藏数据
  Future<List<BlUserDbEntity>?> findAllCollectedAnchor() async {
    List<BlUserDbEntity>? anchors = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isCollectedEqualTo(true).isBlackedEqualTo(false).findAll();
    return anchors;
  }

  // 实时监听缓存的所有主播中收藏数据的数量变化
  StreamSubscription<List<BlUserDbEntity>> findAllCollectedAnchorStream({
    required Function(int, List<BlUserDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isCollectedEqualTo(true).isBlackedEqualTo(false).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("收藏主播发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

  //   查找是否收藏某个主播 isCollected
  Future<bool> findCollectedOneAnchor({required String userId}) async {
    bool isCollected = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().userIdEqualTo(userId).isCollectedEqualTo(true).findFirst() != null;
    return isCollected;
  }

//   更新某个主播的收藏状态
  Future<void> updateIsCollectedOneAnchor({required String userId, required bool isCollected, required Function callback}) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: userId);
    if (anchor != null) {
      anchor.isCollected = isCollected;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor);
      }).then((value) {
        BlLogger.debug("更新收藏状态成功 userId = $userId");
        callback.call();
      });
    } else {
      BlLogger.debug("更新收藏状态失败 userId = $userId");
    }
  }

/////////关注相关
// 查找缓存的所有主播中的关注数据
  Future<List<BlUserDbEntity>?> findAllFocusAnchor() async {
    List<BlUserDbEntity>? anchors = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isFollowedEqualTo(true).isBlackedEqualTo(false).findAll();
    return anchors;
  }

  // 实时监听缓存的所有主播中关注数据的数量变化
  StreamSubscription<List<BlUserDbEntity>> findAllFocusAnchorStream({
    required Function(int, List<BlUserDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isFollowedEqualTo(true).isBlackedEqualTo(false).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("关注主播发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

//   查找是否关注某个主播 isFollowed
  bool findFocusedOneAnchor({required String userId}) {
    bool isFocused = BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().userIdEqualTo(userId).isFollowedEqualTo(true).findFirstSync() != null;
    return isFocused;
  }

  // 实时监听是否关注某个主播 isFollowed
  StreamSubscription<List<BlUserDbEntity>> findFocusedOneAnchorStream({
    required String userId,
    required Function(bool) callback,
  }) {
    return BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().userIdEqualTo(userId).isFollowedEqualTo(true).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("关注主播发生变化 ${event.first.isFollowed}");
      callback.call(event.first.isFollowed == true);
    });
  }

  // 更新某个主播的关注状态
  Future<void> updateIsFocusedOneAnchor({required String userId, required bool isFocused, required Function callback}) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: userId);
    if (anchor != null) {
      anchor.isFollowed = isFocused;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor);
      }).then((value) {
        BlLogger.debug("更新关注状态成功 userId = $userId");
        callback.call();
      });
    } else {
      BlLogger.debug("更新关注状态失败 userId = $userId");
    }
  }

/////////拉黑相关
// 查找缓存的所有主播中的拉黑数据
  Future<List<BlUserDbEntity>?> findAllBlackedAnchor() async {
    List<BlUserDbEntity>? anchors = await BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isBlackedEqualTo(true).findAll();
    return anchors;
  }

//实时监听缓存的所有主播中的拉黑数据变化
  StreamSubscription<List<BlUserDbEntity>> findAllBlackedAnchorStream({
    required Function(int, List<BlUserDbEntity>) callback,
  }) {
    return BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().isBlackedEqualTo(true).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("拉黑主播发生变化 最新数量为${event.length}");
      callback.call(event.length, event);
    });
  }

//   查找是否拉黑某个主播 isBlack
  bool findBlackOneAnchor({required String userId}) {
    BlUserDbEntity? anchor = BlRepositoryManager.to.isar.blUserDbEntitys.where().myIdEqualTo(currentUserId).filter().userIdEqualTo(userId).isBlackedEqualTo(true).findFirstSync();
    return anchor != null;
  }

  //   更新某个主播的l拉黑状态
  Future<void> updateIsBlackOneAnchor({
    required String userId,
    required bool isBlack,
    required Function callback,
  }) async {
    BlUserDbEntity? anchor = await findOneAnchor(userId: userId);
    if (anchor != null) {
      anchor.isBlacked = isBlack;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blUserDbEntitys.put(anchor);
      }).then((value) {
        BlLogger.debug("更新拉黑状态成功 userId = $userId");
        callback.call();
      });
    } else {
      BlLogger.debug("更新拉黑状态失败 userId = $userId");
    }
  }
}
