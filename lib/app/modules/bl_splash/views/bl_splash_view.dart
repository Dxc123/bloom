import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_splash_controller.dart';

class BlSplashView extends StatefulWidget {
  const BlSplashView({super.key});

  @override
  State<BlSplashView> createState() => _BlSplashViewState();
}

class _BlSplashViewState extends State<BlSplashView> {
  final controller = Get.put(BlSplashController());

  @override
  void dispose() {
    Get.delete<BlSplashController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Image.asset(
        "assets/images/app/bl_splash_bg.png",
        fit: BoxFit.cover,
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}
