import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_my_collection_list_controller.dart';

class BlMeMyCollectionListView extends GetView<BlMeMyCollectionListController> {
  const BlMeMyCollectionListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeMyCollectionListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeMyCollectionListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
