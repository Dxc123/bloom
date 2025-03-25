import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../../../../../routes/app_pages.dart';

class BlMeMyFocusListController extends GetxController {
  late final RefreshController refreshController;
  var dataList = <BlUserDbEntity>[].obs;
  StreamSubscription<List<BlUserDbEntity>>? followSub;

  var dataList22 = <BlFlowerDbEntity>[].obs;
  StreamSubscription<List<BlFlowerDbEntity>>? followSub22;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    // onRefresh(showLoading: true);
    followSub = BlMediaRepository.to.findAllFocusAnchorStream(callback: (count, List<BlUserDbEntity> list) {
      dataList.clear();
      dataList.value = list;
    });
    followSub22 = BlMediaRepository.to.findAllFlowerMediaStream(callback: (count, List<BlFlowerDbEntity> list) {
      dataList22.clear();
      dataList22.value = list;
    });
  }

  @override
  void onClose() {
    refreshController.dispose();
    followSub?.cancel();
    followSub22?.cancel();
    super.onClose();
  }

  void onRefresh({bool showLoading = false}) async {
    EasyLoading.show();
    dataList.clear();
    dataList22.clear();
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      List<BlUserDbEntity>? anchors = await BlMediaRepository.to.findAllFocusAnchor();
      dataList.addAll(anchors ?? []);
      List<BlFlowerDbEntity>? anchors22 = await BlMediaRepository.to.findAllFlowerMedia();
      dataList22.addAll(anchors22 ?? []);
      refreshController.refreshCompleted();
    });
  }

  void deleteFollow(BlUserDbEntity model) {
    EasyLoading.show();
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      await BlMediaRepository.to.updateIsFocusedOneAnchor(
        userId: model.userId ?? "",
        isFocused: false,
        callback: () {},
      );
      onRefresh(showLoading: false);
    });
  }

  void deleteFollow22(BlFlowerDbEntity model) {
    EasyLoading.show();
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      await BlMediaRepository.to.updateIsCollectedOneFlowerMedia(
        flowerId: model.flowerId ?? "",
        isCollected: false,
        callback: () {},
      );
      onRefresh(showLoading: false);
    });
  }

  void toDetail(BlUserDbEntity item) {
    Get.toNamed(Routes.BL_HOME_DETAIL, arguments: item);
  }

  void toDetail22(BlFlowerDbEntity item) {
    Get.toNamed(Routes.BL_DISCOVER_DETAIL, arguments: item);
  }
}
