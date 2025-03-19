import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_chat_controller.dart';

class BlChatView extends GetView<BlChatController> {
  const BlChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
