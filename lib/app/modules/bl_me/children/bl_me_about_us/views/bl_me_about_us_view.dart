import 'package:bloom/app/data/bl_service/bl_device_Info_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/bl_common/bl_constants.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/bl_me_about_us_controller.dart';

class BlMeAboutUsView extends GetView<BlMeAboutUsController> {
  const BlMeAboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('About us'),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.titlesList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    child: Image.asset(
                      "assets/images/app/bl_logo.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Bloom",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    BlDeviceInfoService.to.version,
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }
            final title = controller.titlesList[index];
            return InkWell(
              onTap: () {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    Get.toNamed(Routes.BL_WEB_VIEW, arguments: {"url": BlConstants.privacyPolicy, "title": "Privacy policy"});
                    break;
                  case 2:
                    Get.toNamed(Routes.BL_WEB_VIEW, arguments: {"url": BlConstants.agreement, "title": "Terms of service"});
                    break;
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
    );
  }
}
