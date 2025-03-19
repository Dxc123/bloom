import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_black_list_controller.dart';

class BlMeBlackListView extends GetView<BlMeBlackListController> {
  const BlMeBlackListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeBlackListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeBlackListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
