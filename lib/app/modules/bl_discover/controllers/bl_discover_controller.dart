import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/bl_components/bl_black_anchor_dialog.dart';
import '../../../data/bl_components/bl_report_dialog.dart';
import '../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../../../data/bl_service/bl_load_data_service.dart';
import '../../../routes/app_pages.dart';

class BlDiscoverController extends GetxController {
  var dataList22 = <BlUserDbEntity>[].obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    onRefresh(loading: true);
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  void onRefresh({bool loading = false}) async {
    if (loading) {
      EasyLoading.show(status: "loading...");
    }
    await Future.delayed(const Duration(seconds: 1));
    EasyLoading.dismiss();
    dataList22.value = BlLoadDataService.to.shuffleUserList(
      await BlMediaRepository.to.findAllAnchor() ?? [],
    );
    BlLogger.debug("userList = ${dataList22.length}");
    refreshController.refreshCompleted();
  }

  void toDetail({required BlUserDbEntity item}) async {
    Get.toNamed(Routes.BL_DISCOVER_DETAIL, arguments: item);
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
      removeMedia(userId: item.userId ?? "");
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
          removeMedia(userId: item.userId ?? "");
        });
  }

  void onFollow({required BlUserDbEntity item, required int index}) async {
    EasyLoading.show(status: "loading...");
    await Future.delayed(const Duration(milliseconds: 200));
    EasyLoading.dismiss();
    bool isFollowed = item.isFollowed ?? false;
    await BlMediaRepository.to.updateIsFocusedOneAnchor(
        userId: item.userId ?? "",
        isFocused: !isFollowed,
        callback: () async {
          dataList22.removeWhere((element) {
            return element.userId == item.userId;
          });
          item.isFollowed = !isFollowed;
          dataList22.insert(index, item);
        });
  }

  void onCollect({required BlUserDbEntity item, required int index}) async {
    EasyLoading.show(status: "loading...");
    await Future.delayed(const Duration(milliseconds: 200));
    EasyLoading.dismiss();
    bool isCollected = item.isCollected ?? false;
    await BlMediaRepository.to.updateIsCollectedOneAnchor(
        userId: item.userId ?? "",
        isCollected: !isCollected,
        callback: () async {
          dataList22.removeWhere((element) {
            return element.userId == item.userId;
          });
          item.isCollected = !isCollected;
          dataList22.insert(index, item);
        });
  }

  // 拉黑一资源时，删掉这个资源
  void removeMedia({required String userId}) async {
    if (dataList22.isEmpty) return;
    dataList22.removeWhere((element) {
      return element.userId == userId;
    });
    // dataList22.refresh();
    // onRefresh(loading: true);
  }
}
