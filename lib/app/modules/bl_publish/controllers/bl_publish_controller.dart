import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/bl_components/bl_choose_image_until.dart';
import '../../../data/bl_repository/bl_publish/bl_publish_repository.dart';
import '../../../data/bl_repository/bl_publish/entity/bl_publish_media_entity.dart';
import '../../../data/bl_untils/bl_loading.dart';

class BlPublishController extends GetxController  {
  final TextEditingController contentController = TextEditingController(text: "");
  final contentFocusNode = FocusNode();
  var isCanSend = false.obs;
  var picList = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    contentController.addListener(() {
      if ((contentController.text.length) > 300) {
        contentController.text = contentController.text.substring(0, 300);
        contentController.selection = TextSelection(
          baseOffset: contentController.text.length,
          extentOffset: contentController.text.length,
        );
      }
    });
  }

  void onPublish() async {
    if (contentController.text.isEmpty && picList.isEmpty) {
      EasyLoading.showToast("Please enter content and select image");
      return;
    }
    EasyLoading.show(status: "loading...");
    Future.delayed(const Duration(milliseconds: 300), () async {
      EasyLoading.dismiss();
      BlPublishMediaEntity publishMedia = BlPublishMediaEntity();
      publishMedia.title = contentController.text;
      publishMedia.content = contentController.text;
      publishMedia.picList = picList;
      await BlPublishMediaRepository.to.insertOnePublishMedia(
          publishMedia: publishMedia,
          callback: () {
            EasyLoading.showToast("The release was successful");
            Get.back();
          });
    });
  }

  void onPickPic() {
    contentFocusNode.unfocus();
    BlChooseImageUtil(
        type: 0,
        callBack: (uploader, type, url, path) {
          switch (type) {
            case UploadMediaType.cancel:
              {
                BlLoading.dismiss();
              }
              break;
            case UploadMediaType.begin:
              BlLoading.showLoading();
              break;
            case UploadMediaType.success:
              BlLoading.dismiss();
              picList.add(url!);
              BlLogger.debug("picList.length = ${picList.length}");
              update();
              break;
            case UploadMediaType.failed:
              BlLoading.dismiss();
              break;
          }
        }).openChooseDialog();
  }
}