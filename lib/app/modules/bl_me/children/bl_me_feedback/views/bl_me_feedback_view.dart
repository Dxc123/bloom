import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_feedback_controller.dart';

class BlMeFeedbackView extends GetView<BlMeFeedbackController> {
  const BlMeFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: buildFeedbackTitle(),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Obx(() {
                    return GestureDetector(
                      onTap: () {
                        controller.selectIndex.value = index;
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 22),
                        child: Container(
                          height: 50,
                          margin: const EdgeInsetsDirectional.only(bottom: 5),
                          padding: EdgeInsetsDirectional.only(
                            start: 5,
                            end: 5,
                            top: index == 0 ? 20 : 10,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.reportList[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                              if (index == controller.selectIndex.value)
                                Image.asset(
                                  "assets/images/app/bl_login_check_ed.png",
                                  fit: BoxFit.cover,
                                ),
                              if (index != controller.selectIndex.value)
                                Image.asset(
                                  "assets/images/app/bl_login_check.png",
                                  color: Colors.grey,
                                  fit: BoxFit.cover,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
                childCount: controller.reportList.length,
              )),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xFFF6F6F6),
                  ),
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 0, horizontal: 15),
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    minLines: 3,
                    maxLines: 4,
                    maxLength: 200,
                    // controller: introTextController,
                    // focusNode: introFocusNode,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please enter....",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF736F77).withOpacity(0.6),
                      ),
                      // fillColor: const Color(0xFFF9F7FA), //背景色
                      // filled: true, //true，fillColor才有效
                      counterStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(200),
                    ],
                  ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                controller.onFeedbackAction();
              },
              child: Container(
                  height: 60,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 28, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFF95AAA),
                          Color(0xFFF95AAA),
                        ],
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                      )),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFeedbackTitle() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color(0xFFF95AAA), width: 1),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
        alignment: AlignmentDirectional.center,
        child: const Text(
          "In the process of using yseek, is there any programmatic content, or some processes that cause you trouble, you can tell us here",
          style: TextStyle(
            color: Color(0xFFF95AAA),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Feedback',
        style: TextStyle(
          color: Color(0xFF181818),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
