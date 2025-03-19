import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_feedback_controller.dart';

class BlMeFeedbackView extends GetView<BlMeFeedbackController> {
  const BlMeFeedbackView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeFeedbackView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeFeedbackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
