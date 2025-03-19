import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_my_like_list_controller.dart';

class BlMeMyLikeListView extends GetView<BlMeMyLikeListController> {
  const BlMeMyLikeListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeMyLikeListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeMyLikeListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
