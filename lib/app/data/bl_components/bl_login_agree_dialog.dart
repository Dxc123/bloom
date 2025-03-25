import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../bl_common/bl_constants.dart';
import '../bl_service/bl_my_info_service.dart';

class BlLoginAgreeDialog extends StatefulWidget {
  final Function? onAgree;
  const BlLoginAgreeDialog({
    super.key,
    required this.onAgree,
  });

  @override
  State<BlLoginAgreeDialog> createState() => _BlLoginAgreeDialogState();

  static void show({required Function? onAgree}) {
    Get.dialog(BlLoginAgreeDialog(onAgree: onAgree));
  }
}

class _BlLoginAgreeDialogState extends State<BlLoginAgreeDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsetsDirectional.only(start: 30, end: 30),
          padding: const EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Please confirm the privacy policy and terms of service",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(end: 20, top: 20),
                child: Text.rich(
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    WidgetSpan(
                        child: Obx(() {
                          return GestureDetector(
                            onTap: () {
                              AppMyInfoService.to.syncAgreeStatus();
                            },
                            child: Container(
                              padding: const EdgeInsetsDirectional.only(
                                start: 22,
                                end: 5,
                                top: 9,
                                bottom: 7,
                              ),
                              color: Colors.transparent,
                              child: AppMyInfoService.to.agree.value == true
                                  ? Image.asset(
                                "assets/images/app/bl_login_check_ed.png",
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                "assets/images/app/bl_login_check.png",
                                fit: BoxFit.cover,
                                color: Colors.black38,
                              ),
                            ),
                          );
                        }),
                        alignment: PlaceholderAlignment.middle),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: "By sign in app,you agree with our",
                      children: [
                        const TextSpan(text: '  '),
                        TextSpan(
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                              color: Colors.black,
                            ),
                            text: "Privacy policy",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.BL_WEB_VIEW, arguments: {"url": BlConstants.privacyPolicy, "title": "Privacy policy"});
                              }),
                        const TextSpan(text: ' '),
                        const TextSpan(text: "and"),
                        const TextSpan(text: ' '),
                        TextSpan(
                            style: const TextStyle(
                              decorationColor: Colors.black,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                            text: "Terms of service",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.BL_WEB_VIEW, arguments: {"url": BlConstants.agreement, "title": "Terms of service"});
                              }),
                        const TextSpan(text: ' '),
                        const TextSpan(text: ""),
                      ],
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (AppMyInfoService.to.agree.value == false) {
                    AppMyInfoService.to.syncAgreeStatus();
                  }
                  widget.onAgree?.call();
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 20, top: 25),
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF95AAA),
                        Color(0xFFF95AAA),
                      ],
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                    ),
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
