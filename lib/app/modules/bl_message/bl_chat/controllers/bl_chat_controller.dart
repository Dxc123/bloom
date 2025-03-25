import 'dart:async';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../data/bl_components/bl_chat_action_dialog.dart';
import '../../../../data/bl_components/bl_report_dialog.dart';
import '../../../../data/bl_repository/bl_message/bl_message_repository.dart';
import '../../../../data/bl_repository/bl_message/entity/bl_conversation_entity.dart';
import '../../../../data/bl_repository/bl_message/entity/bl_message_entity.dart';

class BlChatController extends GetxController {
  var dataLists = <BlMessageDB>[].obs;
  var conversationsCount = 0.obs;
  var conversationDB = BlConversationDB().obs;

  // 监听chat列表
  StreamSubscription<List<BlMessageDB>>? _dataListSubscription;

  final TextEditingController textEditingController = TextEditingController(text: "");
  late final FocusNode focusNode;
  final isCanSendText = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is BlConversationDB) {
      conversationDB.value = Get.arguments;
      BlLogger.debug("conversationDB.value.anchorUserId = ${conversationDB.value.anchorUserId ?? ""}");
    }
    int conversationId = conversationDB.value.id;
    _dataListSubscription = BlMessageRepository.to.queryMessageStreamByConversationId(
        conversationId: conversationId,
        callback: (event) {
          dataLists.clear();
          dataLists.addAll(event);
          BlLogger.debug("dataLists.length = ${dataLists.length}");
        });

    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {}
    });
  }

  @override
  void onClose() {
    _dataListSubscription?.cancel();
    super.onClose();
  }

  void onChatAction() {
    focusNode.unfocus();
    BlChatActionDialog.showDialog(
      onReport: () async {
        BlReportDialogView.show(onReport: () async {
          EasyLoading.show(status: "loading...");
          await Future.delayed(const Duration(milliseconds: 200));
          EasyLoading.dismiss();
          await BlMessageRepository.to.deleteConversationByConversationId(
              conversationId: conversationDB.value.id,
              callback: () async {
                Get.back();
                // await BlMediaRepository.updateDietPlaMediaBlack(
                //     planId: conversationDB.value.anchorUserId ?? "",
                //     isBlacked: true,
                //     callback: () async {
                //       // 拉黑、也清除关注、收藏数据
                //       await BlMediaRepository.updateDietPlaMediaCollected(
                //           planId: conversationDB.value.anchorUserId ?? "",
                //           isCollected: false,
                //           callback: () async {
                //             await BlMediaRepository.updateDietPlaMediaFollowed(
                //                 planId: conversationDB.value.anchorUserId ?? "",
                //                 isFollowed: false,
                //                 callback: () {
                //                   Get.back();
                //                   // safeFind<ZtDiscoverController>()?.removeMedia(
                //                   //   planId: conversationDB.value.anchorUserId ?? "",
                //                   // );
                //                 });
                //           });
                //     });
              });
        });
      },
      onBlack: () {
        EasyLoading.show(status: "loading...");
        Future.delayed(const Duration(milliseconds: 200), () async {
          EasyLoading.dismiss();
          await BlMessageRepository.to.deleteConversationByConversationId(
              conversationId: conversationDB.value.id,
              callback: () async {
                Get.back();
                // await TrMediaRepository.to.updateIsBlackOneAnchor(
                //     userId: conversationDB.value.anchorUserId ?? "",
                //     isBlack: true,
                //     callback: () async {
                //       // 拉黑、也清除关注、收藏数据
                //       await TrMediaRepository.to.updateIsFocusedOneAnchor(userId: conversationDB.value.anchorUserId ?? "", isFocused: false, callback: () {});
                //       await TrMediaRepository.to.updateIsCollectedOneAnchor(userId: conversationDB.value.anchorUserId ?? "", isCollected: false, callback: () {});
                //       Get.find<TrCategoryController>().removeHost(herId: conversationDB.value.anchorUserId ?? "");
                //     });
              });
        });
      },
      onFollow: () {},
      onClearMsg: () async {
        EasyLoading.show(status: "loading...");
        Future.delayed(const Duration(milliseconds: 200), () async {
          EasyLoading.dismiss();
          await BlMessageRepository.to.deleteMessageByConversationId(conversationId: conversationDB.value.id);
        });
      },
    );
  }

  void sendTextMsg() async {
    String text = textEditingController.text;
    String? anchorId = conversationDB.value.anchorUserId;
    int? conversationId = conversationDB.value.id;

    await BlMessageRepository.to.insertChatMessage(
      conversationId: conversationId,
      msgType: MsgTypeEnum.text,
      contentText: text,
      updatedAt: 0,
      createdAt: 0,
      sendUserId: anchorId,
      receivedUserId: anchorId,
      callback: () {
        textEditingController.text = "";
      },
    );
  }

  void showSendGiftDialog() {
    // Get.dialog(
    //   TrGiftView(
    //     choose: (TrGiftEntity gift, bool isGameGift) {
    //       sendGift(gift, isGameGift);
    //     },
    //     herId: conversationDB.value.anchorUserId,
    //     herName: conversationDB.value.anchorAvatar,
    //   ),
    //   barrierColor: Colors.transparent,
    // );
  }

// void sendGift(TrGiftEntity gift, bool isGameGift) {
//   debugPrint("送礼物gift = ${gift.toJson()}");
//   TrHttpUtil().post<TrGiftSendResultEntity>(TrHttpUrls.sendGiftApiNew,
//       data: {
//         "receiverId": "9999",
//         "quantity": 1,
//         "gid": gift.gid,
//       },
//       showLoading: true, errCallback: (err) {
//         debugPrint("送礼物错误 err = ${err.message}");
//         if (err.code == 8) {
//           debugPrint("送礼物--余额不足");
//           Get.toNamed(Routes.TR_ME_RECHARGE);
//         } else if (err.code == 25) {
//         } else {
//           AppLoading.showToast(err.message);
//         }
//       }).then((value) async {
//     debugPrint("送礼物成功");
//     AppMyInfoService.to.requestLastDetailUserData();
//
//     String text = "${gift.icon}";
//     String? anchorId = conversationDB.value.anchorUserId;
//     int? conversationId = conversationDB.value.id;
//
//     await BlMessageRepository.to.insertChatMessage(
//       conversationId: conversationId,
//       msgType: MsgTypeEnum.gift,
//       contentText: text,
//       updatedAt: 0,
//       createdAt: 0,
//       sendUserId: anchorId,
//       receivedUserId: anchorId,
//       callback: () {
//         textEditingController.text = "";
//       },
//     );
//   });
// }
}

