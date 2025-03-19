import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_setting_controller.dart';

class BlMeSettingView extends GetView<BlMeSettingController> {
  const BlMeSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeSettingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
