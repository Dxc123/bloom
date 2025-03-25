import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/bl_components/bl_empty_view.dart';
import '../../../data/bl_repository/bl_media/entity/bl_flower_db_entity.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bl_home_controller.dart';

class BlHomeView extends StatefulWidget {
  const BlHomeView({super.key});

  @override
  State<BlHomeView> createState() => _BlHomeViewState();
}

class _BlHomeViewState extends State<BlHomeView> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(BlHomeController());

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    Get.delete<BlHomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Flowers'), //Recommended：
        centerTitle: false,
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async => controller.onRefresh(loading: true),
          child: CustomScrollView(
            slivers: [
              if (controller.dataList.isEmpty)
                SliverToBoxAdapter(
                  child: BlEmptyView(
                    onRefresh: () {
                      controller.onRefresh(loading: false);
                    },
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final BlFlowerDbEntity entity = controller.dataList[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.BL_HOME_DETAIL, arguments: entity);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 8,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image.asset(
                                        entity.homeCover ?? "",
                                        fit: BoxFit.fill,
                                        height: 260,
                                      ),
                                    ),
                                    PositionedDirectional(
                                      top: 15,
                                      end: 15,
                                      child: InkWell(
                                        onTap: () {
                                          controller.onCollect(item: entity, index: index);
                                        },
                                        child: Image.asset(
                                          (entity.isCollected ?? false) ? "assets/images/app/bl_home_like_select.png" : "assets/images/app/bl_home_like_normal.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 40,
                                  alignment: AlignmentDirectional.centerStart,
                                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  child: Text(
                                    entity.title ?? "",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      childCount: controller.dataList.length,
                    ),
                  ),
                ),
              SliverToBoxAdapter(
                child: SizedBox(height: Get.bottomBarHeight + 60),
              ),
            ],
          ),
        );
      }),
    );
  }
}
