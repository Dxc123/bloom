import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_discover_detail_controller.dart';

class BlDiscoverDetailView extends GetView<BlDiscoverDetailController> {
  const BlDiscoverDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlDiscoverDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlDiscoverDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
