import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/bl_common/bl_constants.dart';
import '../../../data/bl_components/bl_black_anchor_dialog.dart';
import '../../../data/bl_components/bl_report_dialog.dart';
import '../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../../../data/bl_repository/bl_message/bl_message_repository.dart';
import '../../../data/bl_untils/bl_logger.dart';
import '../../../routes/app_pages.dart';
import '../../bl_discover/controllers/bl_discover_controller.dart';

class BlDiscoverDetailController extends GetxController {
  var dataList = BlUserDbEntity().obs;
  var isFollowed = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      dataList.value = Get.arguments;
    }
  }

  @override
  void onReady() {
    super.onReady();
    isFollowed.value = dataList.value.isFollowed ?? false;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onFollow({required BlUserDbEntity item}) async {
    EasyLoading.show(status: "loading...");
    await Future.delayed(const Duration(milliseconds: 200));
    EasyLoading.dismiss();
    isFollowed.value = !isFollowed.value;
    await BlMediaRepository.to.updateIsFocusedOneAnchor(
        userId: item.userId ?? "",
        isFocused: isFollowed.value,
        callback: () async {
          safeFind<BlDiscoverController>()?.onRefresh();
        });
  }

  void onMessage({required BlUserDbEntity item}) async {
    BlLogger.debug("点击消息item.avatar  = ${item.avatar ?? ""}");
    await BlMessageRepository.to.checkConversation(
        userId: item.userId ?? "",
        portrait: item.avatar ?? "",
        nickname: item.nickName ?? "",
        callBack: (conversation) {
          BlLogger.debug("conversation = ${conversation?.id ?? ""} \n"
              " anchorId = ${conversation?.anchorUserId ?? ""} \n myId =  ${conversation?.myId ?? ""}");
          Get.toNamed(Routes.BL_CHAT, arguments: conversation);
        });
  }

  void onShowMore({required BlUserDbEntity item}) async {
    BlLogger.debug("点击更多item.avatar  = ${item.avatar ?? ""}");
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    height: 40,
                    alignment: AlignmentDirectional.center,
                    child: const Text(
                      "Report",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                    onReport(item: item);
                  },
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    height: 40,
                    alignment: AlignmentDirectional.center,
                    child: const Text(
                      "Block",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                    onBlack(item: item);
                  },
                ),
                InkWell(
                  child: Container(
                    height: 40,
                    alignment: AlignmentDirectional.center,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      useSafeArea: false,
    );
  }

  void onReport({required BlUserDbEntity item}) async {
    BlReportDialogView.show(onReport: () async {
      EasyLoading.show(status: "loading...");
      await Future.delayed(const Duration(milliseconds: 200));
      EasyLoading.dismiss();
      await BlMediaRepository.to.updateIsBlackOneAnchor(
        userId: item.userId ?? "",
        isBlack: true,
        callback: () async {},
      );
      await BlMediaRepository.to.updateIsFocusedOneAnchor(
        userId: item.userId ?? "",
        isFocused: false,
        callback: () {},
      );
      await BlMediaRepository.to.updateIsCollectedOneAnchor(
        userId: item.userId ?? "",
        isCollected: false,
        callback: () {},
      );
      Get.back();
      safeFind<BlDiscoverController>()?.removeMedia(userId: item.userId ?? "");
    });
  }

  void onBlack({required BlUserDbEntity item}) async {
    BlBlackAnchorDialog.showDialog(
        type: BlBlackType.blackAnchor,
        onBlack: () async {
          EasyLoading.show(status: "loading...");
          await Future.delayed(const Duration(milliseconds: 200));
          EasyLoading.dismiss();
          await BlMediaRepository.to.updateIsBlackOneAnchor(
            userId: item.userId ?? "",
            isBlack: true,
            callback: () async {},
          );
          await BlMediaRepository.to.updateIsCollectedOneAnchor(
            userId: item.userId ?? "",
            isCollected: false,
            callback: () async {},
          );
          await BlMediaRepository.to.updateIsFocusedOneAnchor(
            userId: item.userId ?? "",
            isFocused: false,
            callback: () async {},
          );
          Get.back();
          safeFind<BlDiscoverController>()?.removeMedia(userId: item.userId ?? "");
        });
  }
}
