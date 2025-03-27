import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/bl_common/bl_constants.dart';
import '../../../../data/bl_components/bl_empty_view.dart';
import '../../../../data/bl_components/bl_net_image.dart';
import '../../../../data/bl_repository/bl_message/entity/bl_message_entity.dart';
import '../controllers/bl_chat_controller.dart';

class BlChatView extends GetView<BlChatController> {
  const BlChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              return controller.dataLists.isEmpty
                  ? BlEmptyView(
                onRefresh: () {},
              )
                  : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          var item = controller.dataLists[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  minHeight: 50,
                                  minWidth: 50,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF95AAA),
                                  borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(12),
                                    topEnd: Radius.circular(12),
                                    bottomStart: Radius.circular(12),
                                  ),
                                ),
                                margin: const EdgeInsetsDirectional.only(end: 12, top: 10, bottom: 10),
                                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
                                alignment: AlignmentDirectional.centerStart,
                                child: item.msgType == MsgTypeEnum.text
                                    ? Text(
                                  item.text ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                                    : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlImageNetwork(
                                      url: item.text ?? "",
                                      width: 35,
                                      height: 35,
                                      borderRadius: BorderRadius.circular(35 / 2),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text("x1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ],
                                ),
                              ),
                              // TrImageNetwork(
                              //   url: AppMyInfoService.to.myUserData?.portrait ?? "",
                              //   width: 35,
                              //   height: 35,
                              //   borderRadius: BorderRadius.circular(35 / 2),
                              // )
                            ],
                          );
                        },
                        childCount: controller.dataLists.length,
                      ),
                    ),
                  ),
                ],
              );
            }),
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 10,
              child: Container(
                width: Get.width,
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 0),
                child: BlConstants.hasInPurchase == false ? buildBottomTf() : buildBottomTfGift(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomTf() {
    return InkWell(
      onTap: () {
        debugPrint("点击整个输入框");
        if (controller.focusNode.hasFocus) {
          controller.focusNode.unfocus();
        } else {
          controller.focusNode.requestFocus();
        }
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 10, bottom: 0),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 8, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
        height: 48,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: controller.focusNode,
                controller: controller.textEditingController,
                onChanged: (str) {
                  controller.isCanSendText.value = str.isNotEmpty;
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: const InputDecoration.collapsed(
                    hintText: "Please enter...",
                    hintStyle: TextStyle(
                      color: Color(0xFFF8F8F8),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    )),
              ),
            ),
            //发送按钮
            InkWell(
              onTap: () {
                controller.sendTextMsg();
              },
              child: Obx(() {
                return Visibility(
                  visible: controller.isCanSendText.value,
                  child: const Icon(
                    Icons.send,
                    color: Colors.grey,
                    size: 36,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomTfGift() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildBottomTf(),
        ),
        InkWell(
            onTap: () {
              controller.focusNode.unfocus();
              controller.showSendGiftDialog();
            },
            child: Image.asset("assets/images/app/bl_conversation_gift.png"))
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Obx(() {
        return Text(
          controller.conversationDB.value.anchorNickname ?? "",
          style: const TextStyle(
            color: Color(0xFF181818),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
      }),
      actions: controller.conversationDB.value.anchorUserId != "9999"
          ? [
        GestureDetector(
          onTap: () {
            controller.onChatAction();
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: Image.asset(
                  "assets/images/app/bl_nav_more_detail.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ]
          : [],
    );
  }
}
