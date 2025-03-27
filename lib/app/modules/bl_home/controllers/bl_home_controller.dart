import 'dart:async';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../../data/bl_service/bl_load_data_service.dart';

class BlHomeController extends GetxController {
  var dataList = <BlFlowerDbEntity>[].obs;
  StreamSubscription<List<BlFlowerDbEntity>>? streamSubscription;

  @override
  void onInit() {
    super.onInit();
    streamSubscription = BlMediaRepository.to.findAllFlowerMediaStream(callback: (count, List<BlFlowerDbEntity> list) {
      dataList.clear();
      dataList.value = list;
    });
    // Future.delayed(const Duration(milliseconds: 200), () {
    //   onRefresh(loading: true);
    // });
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    super.onClose();
  }

  void onRefresh({bool loading = false}) async {
    if (loading) {
      EasyLoading.show(status: "loading...");
    }
    await Future.delayed(const Duration(seconds: 1));
    EasyLoading.dismiss();
    // dataList.value = BlLoadDataService.to.shuffleFlowerList(
    //   await BlMediaRepository.to.findAllFlowerMedia() ?? [],
    // );
    dataList.value = await BlMediaRepository.to.findAllFlowerMedia() ?? [];
    BlLogger.debug("dataList = ${dataList.length}");
  }

  void onCollect({required BlFlowerDbEntity item, required int index}) async {
    EasyLoading.show(status: "loading...");
    await Future.delayed(const Duration(milliseconds: 200));
    EasyLoading.dismiss();
    bool isCollected = item.isCollected ?? false;
    await BlMediaRepository.to.updateIsCollectedOneFlowerMedia(
      flowerId: item.flowerId ?? "",
      isCollected: !isCollected,
      callback: () {
        dataList.removeWhere((element) {
          return element.flowerId == item.flowerId;
        });
        item.isCollected = !isCollected;
        dataList.insert(index, item);
      },
    );
  }

  // 拉黑一资源时，删掉这个资源
  void removeMedia({required String flowerId}) async {
    if (dataList.isEmpty) return;
    dataList.removeWhere((element) {
      return element.flowerId == flowerId;
    });
    // dataList22.refresh();
    // onRefresh(loading: true);
  }

  void onRefreshUI() {
    dataList.refresh();
  }
}
