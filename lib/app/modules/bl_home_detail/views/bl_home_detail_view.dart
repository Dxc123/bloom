import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../controllers/bl_home_detail_controller.dart';

class BlHomeDetailView extends GetView<BlHomeDetailController> {
  const BlHomeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        final BlFlowerDbEntity item = controller.dataList.value;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Image.asset(
                item.homeCover ?? "",
                fit: BoxFit.fill,
                width: Get.width,
                height: 400,
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.des ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PositionedDirectional(
                    top: 15,
                    end: 15,
                    child: InkWell(
                      onTap: () {
                        controller.onCollect(item: item);
                      },
                      child: Image.asset(
                        controller.isCollected.value ? "assets/images/app/bl_home_like_select.png" : "assets/images/app/bl_home_like_normal.png",
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
