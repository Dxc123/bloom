import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_about_us_controller.dart';

class BlMeAboutUsView extends GetView<BlMeAboutUsController> {
  const BlMeAboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeAboutUsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeAboutUsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
