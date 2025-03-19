import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_my_focus_list_controller.dart';

class BlMeMyFocusListView extends GetView<BlMeMyFocusListController> {
  const BlMeMyFocusListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeMyFocusListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeMyFocusListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
