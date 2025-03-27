import 'package:bloom/app/data/bl_common/bl_constants.dart';
import 'package:bloom/app/data/bl_components/bl_net_image.dart';
import 'package:bloom/app/data/bl_service/bl_my_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/bl_me_controller.dart';

class BlMeView extends StatefulWidget {
  const BlMeView({super.key});

  @override
  State<BlMeView> createState() => _BlMeViewState();
}

class _BlMeViewState extends State<BlMeView> {
  final controller = Get.put(BlMeController());

  @override
  void dispose() {
    Get.delete<BlMeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 200,
          leading: Padding(
            padding: EdgeInsetsDirectional.only(start: 15),
            child: Image.asset(
              "assets/images/app/bl_me_personal.png",
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.BL_ME_EDIT);
              },
              icon: Padding(
                padding: EdgeInsetsDirectional.only(end: 15),
                child: Image.asset(
                  "assets/images/app/bl_me_edit.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.onRefresh();
          },
          child: Obx(() {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: buildInfoWidget(),
                ),
                SliverPadding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 10),
                  sliver: buildSliverList(),
                )
              ],
            );
          }),
        ));
  }

  SliverList buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        final title = controller.titlesList[index];
        final image = controller.imagesList[index];
        return InkWell(
          onTap: () {
            switch (index) {
              case 0:
                Get.toNamed(Routes.BL_ME_MY_LIKE_LIST);
                break;
              case 1:
                Get.toNamed(Routes.BL_ME_MY_COLLECTION_LIST);
                break;
              case 2:
                Get.toNamed(Routes.BL_ME_MY_FOCUS_LIST);
                break;
              case 3:
                Get.toNamed(Routes.BL_ME_FEEDBACK);
                break;
              case 4:
                Get.toNamed(Routes.BL_ME_SETTING);
                break;
              default:
                break;
            }
          },
          child: Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/app/bl_me_arrow_right.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
      childCount: controller.titlesList.length,
    ));
  }

  Widget buildInfoWidget() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/app/bl_me_header_bg.png"),
                fit: BoxFit.fill,
              )),
            ),
            Container(
              color: Color(0xFFF5F5F5),
              height: 150,
            )
          ],
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 0,
          child: BlConstants.hasInPurchase
              ? Stack(
                  children: [
                    PositionedDirectional(
                      start: 16,
                      end: 16,
                      bottom: 0,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/app/bl_me_recharge_bg.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          PositionedDirectional(
                            start: 0,
                            end: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.BL_ME_RECHARGE);
                              },
                              child: Container(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 15),
                                width: double.infinity,
                                height: 80,
                                alignment: AlignmentDirectional.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '111',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'diamonds',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Image.asset(
                                          "assets/images/app/bl_me_diamond_arrow_right.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: _buildContainer(),
                    ),
                  ],
                )
              : _buildContainer(),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
              padding: EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed(Routes.BL_ME_EDIT);
                        },
                        child: BlImageNetwork(
                          url: AppMyInfoService.to.myUserData?.portrait ?? "",
                          width: 80,
                          height: 80,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppMyInfoService.to.myUserData?.nickname ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: AppMyInfoService.to.myUserData?.userId ?? ""));
                              EasyLoading.showToast("Copied successfully");
                            },
                            child: Row(
                              children: [
                                Text(
                                  'ID:${AppMyInfoService.to.myUserData?.userId ?? ""}',
                                  style: const TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/app/bl_me_copy.png",
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.BL_ME_MY_LIKE_LIST);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.likeCount.value.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Likes",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.BL_ME_MY_COLLECTION_LIST);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.collectCount.value.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Collections",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.BL_ME_MY_FOCUS_LIST);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.followCount.value.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Follows",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
  }
}
