import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_controller.dart';

class BlMeView extends GetView<BlMeController> {
  const BlMeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
