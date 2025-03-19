import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_splash_controller.dart';

class BlSplashView extends GetView<BlSplashController> {
  const BlSplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlSplashView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlSplashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
