import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_edit_controller.dart';

class BlMeEditView extends GetView<BlMeEditController> {
  const BlMeEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
