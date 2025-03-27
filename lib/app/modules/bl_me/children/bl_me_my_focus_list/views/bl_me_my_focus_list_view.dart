import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_components/bl_empty_view.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../controllers/bl_me_my_focus_list_controller.dart';

class BlMeMyFocusListView extends GetView<BlMeMyFocusListController> {
  const BlMeMyFocusListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Follows'),
        centerTitle: true,
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
              : CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final BlUserDbEntity item = controller.dataList[index];
                      return buildFollowListItem(item, index);
                    },
                    childCount: controller.dataList.length,
                  ),
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
              //   sliver: SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //           (context, index) {
              //         final item = controller.dataList22[index];
              //         return buildFollowListItem22(item, index);
              //       },
              //       childCount: controller.dataList22.length,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildFollowListItem(BlUserDbEntity item, int index) {
    return GestureDetector(
      onTap: () {
        controller.toDetail(item);
      },
      child: Container(
        height: 80,
        margin: const EdgeInsetsDirectional.only(bottom: 12),
        child: Slidable(
          key: ValueKey("$index"),
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            children: [
              const SizedBox(width: 22, height: 20),
              CustomSlidableAction(
                flex: 1,
                backgroundColor: const Color(0xFFFF5A5F).withOpacity(0.3),
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(16),
                onPressed: (BuildContext context) {
                  BlLogger.debug("移除${item.title}");
                  controller.deleteFollow(item);
                },
                child: Image.asset(
                  "assets/images/app/zt_conversation_delete.webp",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          child: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // TrImageNetwork(
                      //   url: item.avatar ?? "",
                      //   width: 54,
                      //   height: 54,
                      //   borderRadius: BorderRadius.circular(54 / 2),
                      // ),
                      Image.asset(
                        item.avatar ?? "",
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.nickName ?? "",
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.deleteFollow(item);
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        (item.isFollowed ?? false) ? "Followed" : "UnFollow",
                        style: const TextStyle(
                          color: Color(0xFFAEAEAE),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  // Widget buildFollowListItem22(BlFlowerDbEntity item, int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       controller.toDetail22(item);
  //     },
  //     child: Container(
  //       height: 80,
  //       margin: const EdgeInsetsDirectional.only(bottom: 12),
  //       child: Slidable(
  //         key: ValueKey("$index"),
  //         endActionPane: ActionPane(
  //           extentRatio: 0.25,
  //           motion: const ScrollMotion(),
  //           children: [
  //             const SizedBox(width: 22, height: 20),
  //             CustomSlidableAction(
  //               flex: 1,
  //               backgroundColor: const Color(0xFFFF5A5F).withOpacity(0.3),
  //               padding: const EdgeInsets.all(10),
  //               borderRadius: BorderRadius.circular(16),
  //               onPressed: (BuildContext context) {
  //                 BlLogger.debug("移除${item.title}");
  //                 controller.deleteFollow22(item);
  //               },
  //               child: Image.asset(
  //                 "assets/images/app/zt_conversation_delete.webp",
  //                 fit: BoxFit.cover,
  //               ),
  //             )
  //           ],
  //         ),
  //         child: Container(
  //             margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 // Row(
  //                 //   mainAxisAlignment: MainAxisAlignment.start,
  //                 //   children: [
  //                 //     Image.asset(
  //                 //       item.avatar ?? "",
  //                 //       fit: BoxFit.cover,
  //                 //     ),
  //                 //     const SizedBox(width: 10),
  //                 //     Text(
  //                 //       item.nickName ?? "",
  //                 //       style: const TextStyle(
  //                 //         color: Color(0xFF333333),
  //                 //         fontSize: 16,
  //                 //         fontWeight: FontWeight.w600,
  //                 //       ),
  //                 //     ),
  //                 //   ],
  //                 // ),
  //                 InkWell(
  //                   onTap: () {
  //                     controller.deleteFollow22(item);
  //                   },
  //                   child: Container(
  //                     height: 40,
  //                     padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xFFF7F7F7),
  //                       borderRadius: BorderRadius.circular(18),
  //                     ),
  //                     child: Text(
  //                       (item.isFollowed ?? false) ? "Followed" : "UnFollow",
  //                       style: const TextStyle(
  //                         color: Color(0xFFAEAEAE),
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             )),
  //       ),
  //     ),
  //   );
  // }
}
