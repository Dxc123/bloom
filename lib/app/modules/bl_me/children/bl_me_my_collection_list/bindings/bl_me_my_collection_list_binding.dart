import 'package:get/get.dart';

import '../controllers/bl_me_my_collection_list_controller.dart';

class BlMeMyCollectionListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlMeMyCollectionListController>(
      () => BlMeMyCollectionListController(),
    );
  }
}
