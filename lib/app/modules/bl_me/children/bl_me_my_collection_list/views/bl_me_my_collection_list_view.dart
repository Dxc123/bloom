import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_components/bl_empty_view.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../controllers/bl_me_my_collection_list_controller.dart';

class BlMeMyCollectionListView extends GetView<BlMeMyCollectionListController> {
  const BlMeMyCollectionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Collections'),
        centerTitle: false,
      ),
      body: Obx(() {
        return SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () => controller.onRefresh(),
            child: CustomScrollView(
              slivers: [
                controller.dataList22.isEmpty
                    ? SliverToBoxAdapter(
                        child: BlEmptyView(
                          onRefresh: controller.onRefresh,
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 5),
                        sliver: buildSliverGrid22(),
                      ),
              ],
            ));
      }),
    );
  }

  SliverGrid buildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final BlUserDbEntity item = controller.dataList[index];
          return InkWell(
            onTap: () {
              // controller.toDetail(item: item);
            },
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.homeCover ?? "",
                        fit: BoxFit.cover,
                        height: 180,
                        width: (Get.width - 12 * 2 - 10) / 2,
                      ),
                    ),
                    Text(
                      item.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                PositionedDirectional(
                  end: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () => controller.onDeleteCollected(item),
                    child: Image.asset(
                      "assets/images/app/bl_home_like_select.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        childCount: controller.dataList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
    );
  }

  SliverGrid buildSliverGrid22() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final BlFlowerDbEntity item = controller.dataList22[index];
          return InkWell(
            onTap: () {
              // controller.toDetail22(item: item);
            },
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.homeCover ?? "",
                        fit: BoxFit.cover,
                        height: 180,
                        width: (Get.width - 12 * 2 - 10) / 2,
                      ),
                    ),
                    Text(
                      item.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                PositionedDirectional(
                  end: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () => controller.onDeleteCollected22(item),
                    child: Image.asset(
                      "assets/images/app/bl_home_like_select.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        childCount: controller.dataList22.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
    );
  }
}
