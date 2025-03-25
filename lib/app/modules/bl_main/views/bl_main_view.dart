import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../bl_discover/views/bl_discover_view.dart';
import '../../bl_home/views/bl_home_view.dart';
import '../../bl_me/views/bl_me_view.dart';
import '../../bl_message/bl_conversation/views/bl_conversation_view.dart';
import '../controllers/bl_main_controller.dart';

class BlMainView extends StatefulWidget {
  const BlMainView({super.key});

  @override
  State<BlMainView> createState() => _BlMainViewState();
}

class _BlMainViewState extends State<BlMainView> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(BlMainController());

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    Get.delete<BlMainController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Obx(() {
        controller.pageSelectedIndex.value;
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView(
                    pageSnapping: false,
                    scrollBehavior: null,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    children: const [
                      BlHomeView(),
                      BlDiscoverView(),
                      BlConversationView(),
                      BlMeView(),
                    ],
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 0,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      height: 70,
                      decoration: BoxDecoration(image: DecorationImage(image: const AssetImage("assets/images/app/bl_tab_bg.png"), fit: BoxFit.fill)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildSelect("bl_tab_home", 0),
                          _buildSelect("bl_tab_discover", 1),
                          const SizedBox(width: 30, height: 30),
                          _buildSelect("bl_tab_message", 2),
                          _buildSelect("bl_tab_me", 3),
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                      start: 0,
                      end: 0,
                      top: 0,
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            controller.showPublishDialog();
                          },
                          child: Image.asset(
                            "assets/images/app/bl_tab_publish.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  _buildSelect(String imgName, int index) {
    return GestureDetector(
      onTap: () => controller.handleNavBarTap(index),
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Image.asset(
          "assets/images/app/$imgName${index == controller.pageSelectedIndex.value ? "_select" : "_normal"}.png",
          excludeFromSemantics: true,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
