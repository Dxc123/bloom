import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/bl_common/bl_constants.dart';
import '../../../data/bl_repository/bl_media/entity/bl_user_db_entity.dart';
import '../controllers/bl_discover_detail_controller.dart';

class BlDiscoverDetailView extends GetView<BlDiscoverDetailController> {
  const BlDiscoverDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
            onPressed: () => controller.onShowMore(item: controller.dataList.value),
          ),
        ],
      ),
      body: Obx(() {
        final BlUserDbEntity item = controller.dataList.value;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: Get.width,
                height: 327,
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12),
                  ),
                  child: Image.asset(
                    item.homeCover ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 12),
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
                            controller.onFollow(item: item);
                          },
                          child: Image.asset(
                            controller.isFollowed.value ? "assets/images/app/bl_discover_follow_select.png" : "assets/images/app/bl_discover_follow.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                      child: Text(
                        item.des ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 12),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "My Pictures",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final imageUrl = item.picList?[index];
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          child: Image.asset(
                            imageUrl ?? "",
                            fit: BoxFit.cover,
                            width: (Get.width - 15 * 2 - 10) / 2,
                            height: 200,
                          ),
                        ),
                        PositionedDirectional(
                          end: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () {
                              controller.onReport(item: item);
                            },
                            child: Image.asset(
                              "assets/images/app/bl_discover_report.png",
                              fit: BoxFit.cover,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  childCount: item.picList?.length ?? 0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            )
          ],
        );
      }),
      bottomSheet: Container(
        color: Colors.transparent,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlConstants.hasInPurchase
                ? InkWell(
                    onTap: () {},
                    child: Container(
                      width: (Get.width - 12 * 2) * 0.3,
                      height: 44,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/app/bl_discover_detail_gift.png",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Gift",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            InkWell(
              onTap: () => controller.onMessage(item: controller.dataList.value),
              child: Container(
                width: (Get.width - 12 * 2) * 0.6,
                height: 44,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF95AAA),
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/app/bl_discover_detail_msg.png",
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Chat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
