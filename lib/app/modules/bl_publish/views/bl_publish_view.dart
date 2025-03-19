import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_publish_controller.dart';

class BlPublishView extends GetView<BlPublishController> {
  const BlPublishView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlPublishView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlPublishView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
