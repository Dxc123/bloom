import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';

class BlMeBlackListController extends GetxController {
  late final RefreshController refreshController;
  var dataList = <BlUserDbEntity>[].obs;
  StreamSubscription<List<BlUserDbEntity>>? streamSubscription;
  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    streamSubscription = BlMediaRepository.to.findAllBlackedAnchorStream(callback: (count, List<BlUserDbEntity> list) {
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
      List<BlUserDbEntity>? anchors = await BlMediaRepository.to.findAllBlackedAnchor();
      dataList.addAll(anchors ?? []);
      refreshController.refreshCompleted();
    });
  }

  void onDeleteBlacked(BlUserDbEntity model) {
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(milliseconds: 200), () async {
      EasyLoading.dismiss();
      BlMediaRepository.to.updateIsBlackOneAnchor(
          userId: model.userId ?? "",
          isBlack: false,
          callback: () {
            dataList.remove(model);
          });
    });
  }
}