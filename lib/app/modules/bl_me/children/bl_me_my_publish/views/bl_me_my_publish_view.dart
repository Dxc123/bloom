import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_components/bl_empty_view.dart';
import '../../../../../data/bl_components/bl_net_image.dart';
import '../../../../../data/bl_repository/bl_publish/entity/bl_publish_media_entity.dart';
import '../controllers/bl_me_my_publish_controller.dart';

class BlMeMyPublishView extends GetView<BlMeMyPublishController> {
  const BlMeMyPublishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Publish'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.toNamed(Routes.BL_ME_PUBLISH);
        //       },
        //       icon: Image.asset(
        //         "assets/images/app/tr_publish_to_publis.png",
        //         fit: BoxFit.cover,
        //       )),
        //   const SizedBox(width: 15),
        // ],
      ),
      body: Obx(() {
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () {
            controller.onRefresh(showLoading: false);
          },
          child: controller.dataList.isEmpty
              ? BlEmptyView(onRefresh: () {
                  controller.onRefresh(showLoading: true);
                })
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final item = controller.dataList[index];
                    return buildPublishListItem(item, index);
                  },
                  itemCount: controller.dataList.length,
                ),
        );
      }),
    );
  }

  Widget buildPublishListItem(BlPublishMediaEntity item, int index) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LimitedBox(
            maxWidth: Get.width - 12 * 2 - 10 * 2,
            child: Text(
              item.title ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF3F3F3F),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: item.picList!.map((e) {
              return BlImageNetwork(
                url: e,
                width: (Get.width - 12 * 2 - 10 * 2 - 10 * 2) / 3,
                height: (Get.width - 12 * 2 - 10 * 2 - 10 * 2) / 3,
                borderRadius: BorderRadius.circular(10),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    controller.deletePublishMedia(item);
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    size: 28,
                  )),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 28,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 2),
                    child: const Text(
                      'In review....',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFA4A4A4),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
