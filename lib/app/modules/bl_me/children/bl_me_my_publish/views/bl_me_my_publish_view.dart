import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_my_publish_controller.dart';

class BlMeMyPublishView extends GetView<BlMeMyPublishController> {
  const BlMeMyPublishView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeMyPublishView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeMyPublishView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
