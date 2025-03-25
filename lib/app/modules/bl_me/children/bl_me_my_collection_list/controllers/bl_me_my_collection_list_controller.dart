import 'dart:async';

import 'package:bloom/app/modules/bl_discover/controllers/bl_discover_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_common/bl_constants.dart';
import '../../../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../../../../../routes/app_pages.dart';

class BlMeMyCollectionListController extends GetxController  {
  late final RefreshController refreshController;
  var dataList = <BlUserDbEntity>[].obs;
  StreamSubscription<List<BlUserDbEntity>>? streamSubscription;
  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    streamSubscription = BlMediaRepository.to.findAllCollectedAnchorStream(callback: (count, List<BlUserDbEntity> list) {
      dataList.clear();
      dataList.value = list;
    });
  }

  @override
  void onReady() {
    super.onReady();
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
      List<BlUserDbEntity>? anchors = await BlMediaRepository.to.findAllCollectedAnchor();
      dataList.addAll(anchors ?? []);
      refreshController.refreshCompleted();
    });
  }

  void toDetail({required BlUserDbEntity item}) {
    Get.toNamed(Routes.BL_HOME_DETAIL, arguments: item);
  }

  void onDeleteCollected(BlUserDbEntity model) {
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      BlMediaRepository.to.updateIsCollectedOneAnchor(
          userId: model.userId ?? "",
          isCollected: false,
          callback: () {
            dataList.remove(model);
            safeFind<BlDiscoverController>()?.onRefresh();
          });
    });
  }
}