import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../bl_service/bl_my_info_service.dart';
import '../../bl_untils/bl_logger.dart';
import '../bl_repository_manager.dart';
import 'entity/bl_conversation_entity.dart';
import 'entity/bl_message_entity.dart';



class BlMessageRepository extends GetxController {
  static BlMessageRepository get to => Get.find();

  Future<BlMessageRepository> init() async {
    return this;
  }

  //当前用户的id
  static String get currentUserId => AppMyInfoService.to.myUserData?.username ?? "";



  //   *******************消息数据****************//

//******************************************会话列表*************************************************//
//******************************************会话列表*************************************************//
  /// 用户打开一个会话(会话可能已存在或者不存在) readAllMessages 设置该会话的所有消息为已读状态
  Future<void> checkConversation({
    String? userId,
    String? portrait,
    String? nickname,
    required Function(BlConversationDB?) callBack,
    bool readAllMessages = false,
  }) async {
    BlConversationDB? conversation = await BlMessageRepository.to.insertConversation(
      userId: null,
      avatar: null,
      nickName: null,
      contentText: "",
      paraAnchorId: userId,
      paraAnchorPortrait: portrait,
      paraAnchorNickname: nickname,
      callback: () {},
    );

    if (readAllMessages == true) {
      await BlMessageRepository.to.setMessageReadByConversationId(conversationId: conversation?.id, callback: () {});
    }

    callBack.call(conversation);
  }

  //插入一条会话消息（同时也会插入一条对应消息）
  Future<BlConversationDB?> insertConversation({
    String? userId,
    String? avatar,
    String? nickName,
    String? contentText,
    String? paraAnchorId,
    String? paraAnchorPortrait,
    String? paraAnchorNickname,
    required VoidCallback callback,
  }) async {
    // 插入时间毫秒
    int millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    //有谁来创建会话
    String anchorId = userId ?? "";
    String anchorAvatar = avatar ?? "";
    String anchorNickname = nickName ?? "";

    //会话由当前用户创建
    if (paraAnchorId != null) {
      anchorId = paraAnchorId;
      anchorAvatar = paraAnchorPortrait ?? "";
      anchorNickname = paraAnchorNickname ?? "";
    }

    //查询旧有会话列表
    BlConversationDB? conversation = await queryConversationByAnchorId(anchorId: anchorId);
    if (conversation != null) {
      //更新会话
      conversation
        ..myId = currentUserId
        ..anchorUserId = anchorId
        ..updatedAt = millisecondsSinceEpoch
        ..createdAt = millisecondsSinceEpoch
        ..anchorAvatar = anchorAvatar
        ..anchorNickname = anchorNickname;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blConversationDBs.put(conversation!);
      }).then((value) {
        BlLogger.debug("一条会话信息更新完成");
      });
    } else {
      //插入一条新的会话数据
      conversation = BlConversationDB()
        ..myId = currentUserId
        ..anchorUserId = anchorId
        ..updatedAt = millisecondsSinceEpoch
        ..createdAt = millisecondsSinceEpoch
        ..anchorAvatar = anchorAvatar
        ..anchorNickname = anchorNickname;
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blConversationDBs.put(conversation!);
      }).then((value) {
        BlLogger.debug("一条会话信息插入完成");
      });
    }
    if (paraAnchorId == null) {
      //插入一条对应的消息
      await insertChatMessage(
        sendUserId: currentUserId,
        receivedUserId: anchorId,
        msgType: MsgTypeEnum.text,
        contentText: contentText,
        conversationId: conversation.id,
        createdAt: millisecondsSinceEpoch,
        updatedAt: millisecondsSinceEpoch,
        callback: () {
          callback.call();
        },
      );
    }

    return conversation;
  }

  /// 删除指定的一条会话
  Future<void> deleteConversationByConversationId({required int conversationId, required VoidCallback callback}) async {
    await BlRepositoryManager.to.isar.writeTxn(() async {
      BlLogger.debug("删除一条会话数据 id = $conversationId");
      await BlRepositoryManager.to.isar.blConversationDBs.delete(conversationId);
    }).then((value) async {
      //同时也删除对应关联的聊天记录
      BlLogger.debug("同时也删除对应关联的聊天记录");
      await deleteMessageByConversationId(conversationId: conversationId).then((value) => callback.call());
    });
  }

  // 删除当前用户的所有会话列表(同时删除所有关联的消息列表)
  Future<void> deleteAllConversations({required VoidCallback callback}) async {
    List<int> conversationIds = <int>[];
    List<int> chatMessageIds = <int>[];
    // 查询所有会话列表
    List<BlConversationDB>? conversations = await queryAllConversations();
    if (conversations.isNotEmpty) {
      for (var element in conversations) {
        conversationIds.add(element.id);
      }
    }
    // 查询所有消息列表
    List<BlMessageDB>? chatMessages = await queryAllChatMessages();
    if (chatMessages.isNotEmpty) {
      for (var element in chatMessages) {
        chatMessageIds.add(element.id);
      }
    }
    if (conversationIds.isNotEmpty) {
      //删除所有会话 IDs
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blConversationDBs.deleteAll(conversationIds);
      }).then((value) {
        BlLogger.debug("会话信息删除完成");
      });
    }
    if (chatMessageIds.isNotEmpty) {
      //删除所有消息 IDs
      await BlRepositoryManager.to.isar.writeTxn(() async {
        await BlRepositoryManager.to.isar.blMessageDBs.deleteAll(chatMessageIds);
      }).then((value) {
        BlLogger.debug("消息信息删除完成");
      });
    }
  }

  //根据主播 id，查询当前用户与主播对应的会话
  Future<BlConversationDB?> queryConversationByAnchorId({required String anchorId}) async {
    BlConversationDB? conversationDB = await BlRepositoryManager.to.isar.blConversationDBs.where().myIdEqualTo(currentUserId).filter().anchorUserIdEqualTo(anchorId).findFirst();
    return conversationDB;
  }

  ///查询当前用户的所有会话列表,返回结果按更新时间updatedAt
  Future<List<BlConversationDB>> queryAllConversations() async {
    List<BlConversationDB>? conversationDBs = await BlRepositoryManager.to.isar.blConversationDBs.where().myIdEqualTo(currentUserId).sortByUpdatedAtDesc().findAll();
    return conversationDBs;
  }

  //查询当前用户的所有会话列表,结果按更新时间updatedAt最新时间优先 (实时监听会话列表变化)
  StreamSubscription<List<BlConversationDB>> queryAllConversationsStream({
    required Function(List<BlConversationDB>) callback,
  }) {
    return BlRepositoryManager.to.isar.blConversationDBs.where().myIdEqualTo(currentUserId).sortByUpdatedAtDesc().build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("会话列表发生变化");
      callback.call(event);
    });
  }

//******************************************消息列表*************************************************//
//******************************************消息列表*************************************************//

  // 插入一条聊天消息
//   (sendSuccess 默认为0 发送中 1发送成功 则表示直接存入数据库)
  Future<void> insertChatMessage({
    required int? conversationId,
    required MsgTypeEnum? msgType, //(0文本 1图片 2语音 3视频)
    required String? contentText,
    required int? updatedAt,
    required int? createdAt,
    required String? sendUserId,
    required String? receivedUserId,
    int sendSuccess = 0,
    bool? hasRead,
    required VoidCallback callback,
  }) async {
    final newMessage = BlMessageDB()
      ..conversationId = conversationId
      ..myId = currentUserId
      ..updatedAt = updatedAt
      ..createdAt = createdAt
      ..msgType = msgType
      ..text = contentText
      ..hasRead = hasRead == true ? 1 : 0
      ..sendUserId = sendUserId;

    if (sendUserId == currentUserId) {
      //当前用户自己发送的消息 需要存储 整个消息内容
      newMessage.msgContent = contentText;
      //存储当前用户发送的消息 的 接收方
      newMessage.receivedUserId = receivedUserId;
      //自己发送的消息直接为已读
      newMessage.hasRead = 1;
    }
    await BlRepositoryManager.to.isar.writeTxn(() async {
      await BlRepositoryManager.to.isar.blMessageDBs.put(newMessage);
    }).then((value) {
      BlLogger.debug("一条chat消息信息插入完成");
      callback.call();
    });
  }

  // 根据会话id 删除对应的所有消息
  Future<void> deleteMessageByConversationId({required int conversationId}) async {
    await BlRepositoryManager.to.isar.writeTxn(() async {
      List<int> chatIds = <int>[];
      List<BlMessageDB>? chatMessageDBs = await BlRepositoryManager.to.isar.blMessageDBs.where().conversationIdEqualTo(conversationId).findAll();
      if (chatMessageDBs.isNotEmpty) {
        for (var element in chatMessageDBs) {
          chatIds.add(element.id);
        }
      }
      await BlRepositoryManager.to.isar.blMessageDBs.deleteAll(chatIds);
    });
  }

  //查询当前用所有的消息列表
  Future<List<BlMessageDB>> queryAllChatMessages() async {
    List<BlMessageDB>? chatMessageDBs = await BlRepositoryManager.to.isar.blMessageDBs.where().myIdEqualTo(currentUserId).sortByUpdatedAtDesc().findAll();
    return chatMessageDBs;
  }

  // 获取当前用户所有未读消息数量 (实时监听未读消息变化)
  StreamSubscription<List<BlMessageDB>> queryAllUnReadMessagesCountStream({
    required Function(int) callback,
  }) {
    return BlRepositoryManager.to.isar.blMessageDBs.where().filter().hasReadEqualTo(0).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("未读消息发生变化 最新数量为${event.length}");
      callback.call(event.length);
    });
  }

  // 查询当前用户所有未读消息并设置为已读
  Future<void> setAllMessagesHadRead({required VoidCallback callback}) async {
    List<BlMessageDB>? chatMessageDBs = await BlRepositoryManager.to.isar.blMessageDBs.where().myIdEqualTo(currentUserId).filter().hasReadEqualTo(0).findAll();
    //设置为已读
    if (chatMessageDBs.isNotEmpty) {
      for (var element in chatMessageDBs) {
        element.hasRead = 1;
      }
      await BlRepositoryManager.to.isar
          .writeTxn(() async {
        await BlRepositoryManager.to.isar.blMessageDBs.putAll(chatMessageDBs);
      })
          .then((value) {})
          .whenComplete(() => callback.call());
    }
  }

  // 和会话id有关

  //根据会话id查找该会话的所有消息
  Future<List<BlMessageDB>> queryMessageByConversationId({required int conversationId}) async {
    List<BlMessageDB>? chatMessageDBs = await BlRepositoryManager.to.isar.blMessageDBs.where().conversationIdEqualTo(conversationId).sortByUpdatedAtDesc().findAll();
    return chatMessageDBs;
  }

//根据会话id查找该会话的所有消息 (实时监听某个会话id消息变化)
  StreamSubscription<List<BlMessageDB>> queryMessageStreamByConversationId({
    required int conversationId,
    required Function(List<BlMessageDB>) callback,
  }) {
    return BlRepositoryManager.to.isar.blMessageDBs.where().conversationIdEqualTo(conversationId).sortByUpdatedAt().build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("会话conversationId = $conversationId的消息列表发生变化");
      callback.call(event);
    });
  }

  // 根据会话id查找该会话下所有hasRead=0 的未读消息 (实时监听某个会话id未读消息变化)
  StreamSubscription<List<BlMessageDB>> queryUnReadMessageStreamByConversationId({
    required int conversationId,
    required Function(List<BlMessageDB>) callback,
  }) {
    return BlRepositoryManager.to.isar.blMessageDBs.where().conversationIdEqualTo(conversationId).filter().hasReadEqualTo(0).build().watch(fireImmediately: true).listen((event) {
      BlLogger.debug("会话conversationId = $conversationId未读消息发生变化");
      callback.call(event);
    });
  }

  //根据会话id查找该会话下所有hasRead=0 的未读消息 并设置为已读
  Future<void> setMessageReadByConversationId({
    required int? conversationId,
    required VoidCallback callback,
  }) async {
    await BlRepositoryManager.to.isar.writeTxn(() async {
      List<BlMessageDB>? chatMessageDBs = await BlRepositoryManager.to.isar.blMessageDBs.where().conversationIdEqualTo(conversationId).filter().hasReadEqualTo(0).findAll();
      if (chatMessageDBs.isNotEmpty) {
        for (var element in chatMessageDBs) {
          element.hasRead = 1;
        }
        await BlRepositoryManager.to.isar.blMessageDBs.putAll(chatMessageDBs);
      }
    }).then((value) => callback.call());
  }



//   *******************缓存首页资源数据****************//
}
