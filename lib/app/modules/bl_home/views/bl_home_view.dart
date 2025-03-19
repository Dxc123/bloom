import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_home_controller.dart';

class BlHomeView extends GetView<BlHomeController> {
  const BlHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
