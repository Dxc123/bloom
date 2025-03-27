import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/bl_components/bl_net_image.dart';
import '../../../../../data/bl_service/bl_my_info_service.dart';
import '../controllers/bl_me_edit_controller.dart';

class BlMeEditView extends GetView<BlMeEditController> {
  const BlMeEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Edit profile'),
        centerTitle: true,
      ),
      body: Obx(() {
        AppMyInfoService.to.myUserData?.portrait ?? "";
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.titlesList.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    controller.onChangeAvatar();
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 10),
                          child: BlImageNetwork(
                            url: AppMyInfoService.to.myUserData?.portrait ?? "",
                            width: 100,
                            height: 100,
                            borderRadius: BorderRadius.circular(50),
                            placeholder: "assets/images/app/bl_logo.png",
                          ),
                        ),
                        PositionedDirectional(
                            end: 0,
                            bottom: 0,
                            child: Image.asset(
                              "assets/images/app/bl_me_edit_camera.png",
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  ),
                );
              }
              final title = controller.titlesList[index];
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      break;
                    case 1:
                      controller.onChangeName();
                      break;
                    case 2:
                      controller.onChangeBirthday();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Builder(builder: (context) {
                            String valueStr = "";
                            switch (index) {
                              case 0:
                                break;
                              case 1:
                                valueStr = AppMyInfoService.to.myUserData?.nickname ?? "";
                                break;
                              case 2:
                                //2015-05-20 00:00:00.000
                                valueStr = DateFormat('yyyy-MM-dd').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    AppMyInfoService.to.myUserData?.birthday ?? 0,
                                  ),
                                );
                                break;
                            }
                            return Text(
                              valueStr,
                              style: const TextStyle(
                                color: Color(0xFF736F77),
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            );
                          }),
                          Image.asset(
                            "assets/images/app/bl_me_arrow_right.png",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
