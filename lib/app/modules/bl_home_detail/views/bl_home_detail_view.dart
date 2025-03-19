import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_home_detail_controller.dart';

class BlHomeDetailView extends GetView<BlHomeDetailController> {
  const BlHomeDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlHomeDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlHomeDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
