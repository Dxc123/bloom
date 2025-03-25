import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_components/bl_empty_view.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../controllers/bl_me_media_black_list_controller.dart';

class BlMeMediaBlackListView extends GetView<BlMeMediaBlackListController> {
  const BlMeMediaBlackListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Resource Black List'),
        centerTitle: true,
      ),
      body: Obx(() {
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.onRefresh(),
          child: controller.dataList.isEmpty
              ? BlEmptyView(
            onRefresh: controller.onRefresh,
          )
              : ListView.builder(
            itemBuilder: (context, index) {
              BlFlowerDbEntity item = controller.dataList[index];
              return Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
                padding: const EdgeInsetsDirectional.all(12),
                child: InkWell(
                  onTap: () {
                    // controller.toDetail(item: item);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(0),
                            child: Image.asset(
                              item.homeCover ?? "",
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Text(
                          //   item.nickName ?? "",
                          //   style: const TextStyle(
                          //     color: Color(0xFF181818),
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          controller.onDeleteBlacked(item);
                        },
                        child: Container(
                          padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F5F8),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: controller.dataList.length,
          ),
        );
      }),
    );
  }
}
