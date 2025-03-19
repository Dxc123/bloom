import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_conversation_controller.dart';

class BlConversationView extends GetView<BlConversationController> {
  const BlConversationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlConversationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlConversationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
