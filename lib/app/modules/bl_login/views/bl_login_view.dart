import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_login_controller.dart';

class BlLoginView extends GetView<BlLoginController> {
  const BlLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
