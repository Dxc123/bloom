import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../bl_models/bl_base_data_entity.dart';
import '../bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../bl_repository/bl_media/entity/bl_user_db_entity.dart';

class BlLoadDataService extends GetxService {
  static BlLoadDataService get to => Get.find();

  Future<BlLoadDataService> init() async {
    requestLoadData();
    return this;
  }

  var userList = <BlUserEntity>[].obs;
  var flowerList = <BlFlowerEntity>[].obs;

  Future<void> requestLoadData({bool loading = false}) async {
    if (loading) {
      EasyLoading.show(status: "loading...");
    }
    await rootBundle.loadString("assets/config/config_data.json").then((value) async {
      EasyLoading.dismiss();
      BlBaseEntity? entity;
      try {
        entity = BlBaseEntity.fromJson(json.decode(value));
      } catch (e) {
        BlLogger.debug("error =$e");
      }
      if (entity == null) return;
      if (entity.userList != null) {
        userList.value = entity.userList ?? [];
      }
      if (entity.flowerList != null) {
        flowerList.value = entity.flowerList ?? [];
      }

      BlLogger.debug("userList = ${userList.length}");
      BlLogger.debug("flowerList = ${flowerList.length}");
    });
  }

  //打乱UserList
  List<BlUserDbEntity> shuffleUserList(List<BlUserDbEntity> arr) {
    List<BlUserDbEntity> shuffledUserList =  List.from(arr);
    shuffledUserList.shuffle(Random());
    return shuffledUserList;
  }

  List<BlFlowerDbEntity> shuffleFlowerList(List<BlFlowerDbEntity> arr) {
    List<BlFlowerDbEntity> shuffledFlowerList = List.from(arr);
    shuffledFlowerList.shuffle(Random());
    return shuffledFlowerList;
  }
}
