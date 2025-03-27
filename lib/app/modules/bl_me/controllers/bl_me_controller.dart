import 'dart:async';

import 'package:bloom/app/data/bl_service/bl_my_info_service.dart';
import 'package:get/get.dart';

import '../../../data/bl_repository/bl_media/bl_media_repository.dart';
import '../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';

class BlMeController extends GetxController {
  final titlesList = [
    "My Like",
    "My Collection",
    "My focus",
    "Feedback",
    "Setting",
  ];
  final imagesList = [
    "assets/images/app/bl_me_like.png",
    "assets/images/app/bl_me_collection.png",
    "assets/images/app/bl_me_focus.png",
    "assets/images/app/bl_me_feedback.png",
    "assets/images/app/bl_me_setting.png",
  ];


  var likeCount = 0.obs;
  var followCount = 0.obs;
  var collectCount = 0.obs;
  StreamSubscription<List<BlUserDbEntity>>? _followsCountSubscription;
  StreamSubscription<List<BlUserDbEntity>>? _likesCountSubscription;
  StreamSubscription<List<BlFlowerDbEntity>>? _collectCountSubscription;

  @override
  void onInit() {
    super.onInit();
    onRefresh();
    _likesCountSubscription = BlMediaRepository.to.findAllLikedAnchorStream(callback: (int count, List<BlUserDbEntity> data) {
      likeCount.value = count;
    });
    _followsCountSubscription = BlMediaRepository.to.findAllFocusAnchorStream(callback: (int count, List<BlUserDbEntity> data) {
      followCount.value = count;
    });
    _collectCountSubscription = BlMediaRepository.to.findAllCollectedFlowerMediaStream(callback: (int count, List<BlFlowerDbEntity> List) {
      collectCount.value = count;
    });
  }
  @override
  void onClose() {
    _followsCountSubscription?.cancel();
    _likesCountSubscription?.cancel();
    _collectCountSubscription?.cancel();
    super.onClose();
  }


  void onRefresh({bool showLoading = false}) {
    AppMyInfoService.to.requestLastDetailUserData(showLoading:showLoading);
  }

}
