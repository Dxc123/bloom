import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/bl_me_setting_controller.dart';

class BlMeSettingView extends GetView<BlMeSettingController> {
  const BlMeSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.titlesList.length,
                itemBuilder: (context, index) {
                  final title = controller.titlesList[index];
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(Routes.BL_ME_BLACK_LIST);
                      } else if (index == 1) {
                        Get.toNamed(Routes.BL_ME_MEDIA_BLACK_LIST);
                      } else if (index == 2) {
                        Get.toNamed(Routes.BL_ME_FEEDBACK);
                      } else if (index == 3) {
                        Get.toNamed(Routes.BL_ME_ABOUT_US);
                      } else if (index == 4) {
                        controller.onDeleteAccount();
                      } else if (index == 5) {
                        Get.toNamed(Routes.BL_ME_MY_PUBLISH);
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 12),
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset(
                            "assets/images/app/bl_me_arrow_right.png",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 20,
                child: InkWell(
                  onTap: () {
                    controller.logout();
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 28),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFF95AAA),
                          Color(0xFFF95AAA),
                        ],
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                      ),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
