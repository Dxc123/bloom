import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_main_controller.dart';

class BlMainView extends GetView<BlMainController> {
  const BlMainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMainView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMainView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
