import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/bl_common/bl_constants.dart';
import '../../../data/bl_components/bl_black_anchor_dialog.dart';
import '../../../data/bl_components/bl_report_dialog.dart';
import '../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../bl_home/controllers/bl_home_controller.dart';

class BlHomeDetailController extends GetxController {
  var dataList = BlFlowerDbEntity().obs;

  var isCollected = false.obs;

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
    isCollected.value = dataList.value.isCollected ?? false;
  }

  void onShowMore({required BlFlowerDbEntity item}) async {
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
                    margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
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
                // InkWell(
                //   child: const Text(
                //     "Block",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 16,
                //     ),
                //   ),
                //   onTap: () {
                //     Get.back();
                //     onBlack(item: item);
                //   },
                // ),
                // const SizedBox(height: 15),
                InkWell(
                  child: Container(
                    margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                    alignment: AlignmentDirectional.center,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
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

  void onReport({required BlFlowerDbEntity item}) async {
    BlReportDialogView.show(onReport: () async {
      EasyLoading.show(status: "loading...");
      await Future.delayed(const Duration(milliseconds: 200));
      EasyLoading.dismiss();
      await BlMediaRepository.to.updateIsBlackedOneFlowerMedia(
        flowerId: item.flowerId ?? "",
        isBlacked: true,
        callback: () async {},
      );
      Get.back();
      safeFind<BlHomeController>()?.removeMedia(flowerId: item.flowerId ?? "");
    });
  }

  void onBlack({required BlFlowerDbEntity item}) async {
    BlBlackAnchorDialog.showDialog(
        type: BlBlackType.blackAnchor,
        onBlack: () async {
          EasyLoading.show(status: "loading...");
          await Future.delayed(const Duration(milliseconds: 200));
          EasyLoading.dismiss();
          await BlMediaRepository.to.updateIsBlackedOneFlowerMedia(
            flowerId: item.flowerId ?? "",
            isBlacked: true,
            callback: () async {},
          );
          Get.back();
          safeFind<BlHomeController>()?.removeMedia(flowerId: item.flowerId ?? "");
        });
  }

  void onCollect({required BlFlowerDbEntity item}) async {
    EasyLoading.show(status: "loading...");
    await Future.delayed(const Duration(milliseconds: 200));
    EasyLoading.dismiss();
    isCollected.value = !isCollected.value;
    await BlMediaRepository.to.updateIsCollectedOneFlowerMedia(
      flowerId: item.flowerId ?? "",
      isCollected: isCollected.value,
      callback: () {
        safeFind<BlHomeController>()?.onRefresh();

      },
    );
  }
}
