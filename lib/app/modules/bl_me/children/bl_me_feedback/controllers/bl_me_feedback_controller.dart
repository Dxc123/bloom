import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BlMeFeedbackController extends GetxController {
  var selectIndex = 0.obs;
  List<String> reportList = [
    "Advertising fraud",
    "Harass me",
    "Imitate",
    "Lllegal and criminal",
    "Sexual hint",
    "Child Abuse",
    "Others",
  ];

  TextEditingController introTextController = TextEditingController();
  FocusNode introFocusNode = FocusNode();
  @override
  void onInit() {
    super.onInit();
    introTextController.addListener(() {
      BlLogger.debug("输入的内容 = ${introTextController.text}");
    });
  }

  void onFeedbackAction() {
    if (introTextController.text != "") {
      EasyLoading.showToast("Please enter your feedback");
      return;
    }
    introTextController.text = "";
    introFocusNode.unfocus();
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(milliseconds: 200), () {
      EasyLoading.dismiss();
      EasyLoading.showToast("Feedback success");
      Get.back();
    });
  }
}
