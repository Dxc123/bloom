import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/bl_components/bl_empty_view.dart';
import '../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bl_discover_controller.dart';

class BlDiscoverView extends StatefulWidget {
  const BlDiscoverView({super.key});

  @override
  State<BlDiscoverView> createState() => _BlDiscoverViewState();
}

class _BlDiscoverViewState extends State<BlDiscoverView> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(BlDiscoverController());

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    Get.delete<BlDiscoverController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Discover'),//Community
        centerTitle: false,
      ),
      body: Obx(() {
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          child: CustomScrollView(
            slivers: [
              if (controller.dataList22.isEmpty)
                SliverToBoxAdapter(child: BlEmptyView(
                  onRefresh: () {
                    controller.onRefresh(loading: false);
                  },
                ))
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final BlUserDbEntity item = controller.dataList22[index];
                      return InkWell(
                        onTap: () => Get.toNamed(Routes.BL_DISCOVER_DETAIL, arguments: item),
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
                                  InkWell(
                                    onTap: () {
                                      controller.onFollow(item: item, index: index);
                                    },
                                    child: Image.asset(
                                      (item.isFollowed ?? false) ? "assets/images/app/bl_discover_follow_select.png" : "assets/images/app/bl_discover_follow.png",
                                      fit: BoxFit.cover,
                                    ),
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
                                    InkWell(
                                      onTap: () {
                                        controller.onReport(item: item);
                                      },
                                      child: Image.asset(
                                        "assets/images/app/bl_discover_report.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.onCollect(item: item, index: index);
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            (item.isCollected ?? false) ? "assets/images/app/bl_discover_like_select.png" : "assets/images/app/bl_discover_like_normal.png",
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
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: controller.dataList22.length,
                  ),
                ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              )
            ],
          ),
        );
      }),
    );
  }
}
