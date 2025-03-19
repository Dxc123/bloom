import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlReportDialogView extends StatefulWidget {
  const BlReportDialogView({
    super.key,
    required this.onReport,
  });

  final Function() onReport;

  @override
  State<BlReportDialogView> createState() => _HcReportDialogViewState();

  static void show({
    required Function() onReport,
  }) {
    Get.dialog(
      BlReportDialogView(
        onReport: onReport,
      ),
      useSafeArea: false,
    );
  }
}

class _HcReportDialogViewState extends State<BlReportDialogView> {
  var selectIndex = 0.obs;
  List<String> reportList = [
    "Advertising fraud",
    "Harass me",
    "Imitate",
    "Lllegal and criminal",
    "Sexual hint",
    "Child Abuse",
    "Others",
  ];
  TextEditingController introTextController = TextEditingController();
  FocusNode introFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: Get.height * 0.7,
          padding: const EdgeInsetsDirectional.only(top: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              topEnd: Radius.circular(16),
            ),
          ),
          child: Stack(
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
                            selectIndex.value = index;
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
                                      reportList[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF333333),
                                      ),
                                    ),
                                  ),
                                  if (index == selectIndex.value)
                                    Image.asset(
                                      "assets/images/app/wi_login_checked.webp",
                                      fit: BoxFit.cover,
                                    ),
                                  if (index != selectIndex.value)
                                    Image.asset(
                                      "assets/images/app/wi_login_check.webp",
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
                    childCount: reportList.length,
                  )),
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(14),
                  //       color: const Color(0xFFF6F6F6),
                  //     ),
                  //     margin: const EdgeInsetsDirectional.symmetric(vertical: 0, horizontal: 15),
                  //     padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
                  //     child: TextField(
                  //       minLines: 3,
                  //       maxLines: 4,
                  //       maxLength: 200,
                  //       // controller: introTextController,
                  //       // focusNode: introFocusNode,
                  //       style: const TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       ),
                  //       decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         hintText: "Please enter....",
                  //         hintStyle: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600,
                  //           color: const Color(0xFF736F77).withOpacity(0.6),
                  //         ),
                  //         // fillColor: const Color(0xFFF9F7FA), //背景色
                  //         // filled: true, //true，fillColor才有效
                  //         counterStyle: const TextStyle(
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //       textInputAction: TextInputAction.done,
                  //       inputFormatters: [
                  //         LengthLimitingTextInputFormatter(200),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    widget.onReport.call();
                  },
                  child: Container(
                      height: 60,
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 28, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black,
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
        )
      ],
    );
  }

  Widget buildFeedbackTitle() {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(13),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
        alignment: AlignmentDirectional.center,
        child: const Text(
          "In the process of using Bloom, is there any programmatic content, or some processes that cause you trouble, you can tell us here",
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ));
  }
}
