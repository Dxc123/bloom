import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/bl_components/bl_empty_view.dart';
import '../../../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../controllers/bl_me_my_like_list_controller.dart';

class BlMeMyLikeListView extends GetView<BlMeMyLikeListController> {
  const BlMeMyLikeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Likes'),
        centerTitle: false,
      ),
      body: Obx(() {
        return SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () => controller.onRefresh(),
            child: CustomScrollView(
              slivers: [
                controller.dataList.isEmpty
                    ? SliverToBoxAdapter(
                        child: BlEmptyView(
                          onRefresh: controller.onRefresh,
                        ),
                      )
                    : SliverPadding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 5),
                        sliver: SliverList(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              final BlUserDbEntity item = controller.dataList[index];
                              return InkWell(
                                onTap: () {
                                  controller.toDetail(item: item);
                                },
                                child: Container(
                                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 12),
                                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 5),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                item.avatar ?? "",
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                item.nickName ?? "",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                                        width: Get.width - 12 * 2,
                                        height: 327,
                                        child: ClipRRect(
                                          borderRadius: BorderRadiusDirectional.circular(10),
                                          child: Image.asset(
                                            item.homeCover ?? "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 12),
                                        child: Text(
                                          item.des ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                DateTime date = DateTime.fromMillisecondsSinceEpoch(item.updatedAt ?? 0);
                                                String timestamp = "${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
                                                return Text(timestamp,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF999999),
                                                    ));
                                              }
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.onReport(item: item);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/app/bl_discover_report.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  onTap: () {
                                                    controller.onDeleteLiked(item: item);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/app/bl_discover_like_select.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                      const Text(
                                                        "Like",
                                                        style: TextStyle(fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                        }, childCount: controller.dataList.length,)),
                      ),
              ],
            ));
      }),
    );
  }
}
