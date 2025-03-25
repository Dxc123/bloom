import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../data/bl_service/bl_load_data_service.dart';
import '../../bl_publish/views/bl_publish_view.dart';

class BlMainController extends GetxController {
  late final PageController pageController;
  var pageSelectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    _cacheData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _cacheData() async {
    // 缓存到本地
    if (BlLoadDataService.to.flowerList.isNotEmpty) {
      BlMediaRepository.to.insertFlowerMedias(
        list: BlLoadDataService.to.flowerList,
        callback: () {},
      );
    }
    if (BlLoadDataService.to.userList.isNotEmpty) {
      BlMediaRepository.to.insertAllAnchor(
        list: BlLoadDataService.to.userList,
        callback: () {},
      );
    }
  }

  void handleNavBarTap(int index) {
    if (pageSelectedIndex.value == index) return;
    pageSelectedIndex.value = index;
    update();
    pageController.jumpToPage(index);
  }

  void showPublishDialog() {
    Get.dialog(
      BlPublishView(),
      useSafeArea: false,
    );
  }
}
