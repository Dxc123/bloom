import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/bl_common/bl_constants.dart';
import '../../../data/bl_service/bl_my_info_service.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bl_login_controller.dart';

class BlLoginView extends GetView<BlLoginController> {
  const BlLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBody: true,
      extendBodyBehindAppBar: true,
      body:Container(
        height: Get.height,
        alignment: AlignmentDirectional.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/app/bl_login_bg.png"),
            fit: BoxFit.fill
          )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => controller.googleSignIn(),
                  child: Container(
                    height: 53,
                    alignment: AlignmentDirectional.center,
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF95AAA),
                      borderRadius: BorderRadius.circular(53/2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/app/bl_login_google.png",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 30),
                        const Text(
                          'sign in with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () => controller.appleSignIn(),
                  child: Container(
                    height: 53,
                    alignment: AlignmentDirectional.center,
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(53/2),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/app/bl_login_apple.png",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 30),
                        const Text(
                          'sign in with Apple',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () => controller.visitorSignIn(),
                  child: Container(
                    height: 53,
                    alignment: AlignmentDirectional.center,
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(53/2),
                    ),
                    child: const Text(
                      'visitor login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildBottomRichTextWidget(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomRichTextWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 30, bottom: 10, end: 10),
      child: Text.rich(
        TextSpan(children: [
          WidgetSpan(
              child: GestureDetector(
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
                  child: Obx(() {
                    return AppMyInfoService.to.agree.value == true
                        ? Image.asset(
                      "assets/images/app/bl_login_check_ed.png",
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      "assets/images/app/bl_login_check.png",
                      fit: BoxFit.cover,
                    );
                  }),
                ),
              ),
              alignment: PlaceholderAlignment.middle),
          TextSpan(
            text: "By sign in app,you agree with our",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            children: [
              const TextSpan(text: '  '),
              TextSpan(
                  style: const TextStyle(
                    color:  Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
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
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor:Colors.white,
                  ),
                  text: "Terms of service",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.BL_WEB_VIEW, arguments: {"url": BlConstants.agreement, "title": "Terms of service"});
                    }),
              const TextSpan(text: ' '),
            ],
          )
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
