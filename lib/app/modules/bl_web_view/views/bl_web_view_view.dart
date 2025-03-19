import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_web_view_controller.dart';

class BlWebViewView extends GetView<BlWebViewController> {
  const BlWebViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlWebViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlWebViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
