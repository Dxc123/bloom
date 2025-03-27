import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_common/bl_constants.dart';
import '../../../../../data/bl_components/bl_report_dialog.dart';
import '../../../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../bl_discover/controllers/bl_discover_controller.dart';

class BlMeMyLikeListController extends GetxController {
  late final RefreshController refreshController;
  var dataList = <BlUserDbEntity>[].obs;
  StreamSubscription<List<BlUserDbEntity>>? streamSubscription;
  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    streamSubscription = BlMediaRepository.to.findAllLikedAnchorStream(callback: (count, List<BlUserDbEntity> list) {
      dataList.clear();
      dataList.value = list;
    });
  }

  @override
  void onClose() {
    refreshController.dispose();
    streamSubscription?.cancel();
    super.onClose();
  }

  void onRefresh({bool showLoading = false}) async {
    EasyLoading.show(status: "loading...");
    dataList.clear();
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      List<BlUserDbEntity>? anchors = await BlMediaRepository.to.findAllLikedAnchor();
      dataList.addAll(anchors ?? []);
      refreshController.refreshCompleted();
    });
  }

  void toDetail({required BlUserDbEntity item}) {
    Get.toNamed(Routes.BL_DISCOVER_DETAIL, arguments: item);
  }

  void onDeleteLiked({required BlUserDbEntity item}) {
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      BlMediaRepository.to.updateIsLikedOneAnchor(
          userId: item.userId ?? "",
          isLiked: false,
          callback: () {
            dataList.remove(item);
            safeFind<BlDiscoverController>()?.onRefresh();
          });
    });
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
      await BlMediaRepository.to.updateIsLikedOneAnchor(
        userId: item.userId ?? "",
        isLiked: false,
        callback: () {},
      );
      safeFind<BlDiscoverController>()?.onRefresh();
    });
  }
}
