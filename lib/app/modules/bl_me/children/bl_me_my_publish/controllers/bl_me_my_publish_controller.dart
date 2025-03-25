import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_repository/bl_publish/bl_publish_repository.dart';
import '../../../../../data/bl_repository/bl_publish/entity/bl_publish_media_entity.dart';

class BlMeMyPublishController extends GetxController {
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  var dataList = <BlPublishMediaEntity>[].obs;
  StreamSubscription<List<BlPublishMediaEntity>>? publishSub;
  @override
  void onInit() async {
    super.onInit();
    // onRefresh(showLoading: true);
    publishSub = BlPublishMediaRepository.to.findAllPublishMediaStream(callback: (count, List<BlPublishMediaEntity> list) {
      dataList.clear();
      dataList.value = list;
    });

  }

  @override
  void onClose() {
    refreshController.dispose();
    publishSub?.cancel();
    super.onClose();
  }

  void onRefresh({bool showLoading = false}) async {
    EasyLoading.show();
    dataList.clear();
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      List<BlPublishMediaEntity>? anchors = await BlPublishMediaRepository.to.findAllPublishMedia();
      dataList.addAll(anchors ?? []);
      refreshController.refreshCompleted();
    });
  }

  void deletePublishMedia(BlPublishMediaEntity model) {
    EasyLoading.show();
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      await BlPublishMediaRepository.to.deleteOnePublishMedia(
          publishMedia: model,
          callback: () {
            onRefresh();
          });
    });
  }
}

