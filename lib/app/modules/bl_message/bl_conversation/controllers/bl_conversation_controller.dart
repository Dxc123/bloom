import 'dart:async';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../data/bl_repository/bl_message/bl_message_repository.dart';
import '../../../../data/bl_repository/bl_message/entity/bl_conversation_entity.dart';
import '../../../../routes/app_pages.dart';

class BlConversationController extends GetxController {
  var conversationLists = <BlConversationDB>[].obs;
  var conversationsCount = 0.obs;

  // 监听会话列表
  StreamSubscription<List<BlConversationDB>>? _conversationsSubscription;

  @override
  void onInit() {
    super.onInit();
    _conversationsSubscription = BlMessageRepository.to.queryAllConversationsStream(callback: (event) {
      conversationLists.clear();
      //官方消息排序优先
      Iterable<BlConversationDB?> systemResults = event.where((element) => element.anchorUserId == "9999");
      BlConversationDB? systemConversation = systemResults.isNotEmpty ? systemResults.first : null;
      if (systemConversation != null) {
        conversationLists.add(systemConversation);
        event.remove(systemConversation);
      }
      conversationLists.addAll(event);
      conversationsCount.value = conversationLists.length;
    });
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () {
      // BlMessageRepository.to.checkConversation(
      //   userId: "9999",
      //   portrait: "assets/images/app/app_conversation_custom_sever.png",
      //   nickname: "Customer Service",
      //   callBack: (conversation) {},
      // );
      // "userId": "20007",
      // "nickName": "Abigail",
      // "avatar": "assets/images/app/avatar_20007.png",
      BlMessageRepository.to.checkConversation(
        userId: "202530001",
        portrait: "assets/images/app/app_avatar_1.png",
        nickname: "Emma",
        callBack: (conversation) {},
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
    _conversationsSubscription?.cancel();
  }

  // 刷新会话
  void refreshConversationsData({bool showLoad = true}) {}

  /// 清空当前用户的所有会话列表
  Future<void> clearConversations() async {
    await BlMessageRepository.to.deleteAllConversations(callback: () {
      conversationLists.clear();
    });
  }

  /// 设置当前用户所有未读消息为已读
  Future<void> readAllMessages() async {
    EasyLoading.show(status: "loading...");
    await BlMessageRepository.to.setAllMessagesHadRead(callback: () {
      EasyLoading.dismiss();
    });
  }

  // 删除某个会话
  void onDeleteConversation(BlConversationDB conversationDB) async {
    await BlMessageRepository.to.deleteConversationByConversationId(
      conversationId: conversationDB.id,
      callback: () {},
    );
  }

  void onClearConversation() async {
    await BlMessageRepository.to.deleteAllConversations(callback: () {});
  }

  void onReadConversation() async {
    await BlMessageRepository.to.setAllMessagesHadRead(callback: () {});
  }

  void gotoCustomerService() async {
    await BlMessageRepository.to.checkConversation(
        userId: "9999",
        portrait: "assets/images/app/app_conversation_custom_sever.png",
        nickname: "Customer Service",
        callBack: (conversation) {
          BlLogger.debug("conversation = ${conversation?.id ?? ""} \n"
              " anchorId = ${conversation?.anchorUserId ?? ""} \n myId =  ${conversation?.myId ?? ""}");
          Get.toNamed(Routes.BL_CHAT, arguments: conversation);
        });
  }
}
