import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_discover_controller.dart';

class BlDiscoverView extends GetView<BlDiscoverController> {
  const BlDiscoverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlDiscoverView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlDiscoverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
