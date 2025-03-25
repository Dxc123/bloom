import 'dart:async';

import 'package:bloom/app/data/bl_repository/bl_media/bl_media_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';

class BlMeMediaBlackListController extends GetxController {
  late final RefreshController refreshController;
  var dataList = <BlFlowerDbEntity>[].obs;
  StreamSubscription<List<BlFlowerDbEntity>>? streamSubscription;
  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    streamSubscription = BlMediaRepository.to.findAllBlackedFlowerMediaStream(callback: (count, List<BlFlowerDbEntity> list) {
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
      List<BlFlowerDbEntity>? anchors = await BlMediaRepository.to.findAllBlackedFlowerMedia();
      dataList.addAll(anchors ?? []);
      refreshController.refreshCompleted();
    });
  }

  void onDeleteBlacked(BlFlowerDbEntity model) {
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      BlMediaRepository.to.updateIsBlackedOneFlowerMedia(
          flowerId: model.flowerId ?? "",
          isBlacked: false,
          callback: () {
            dataList.remove(model);
          });
    });
  }
}
