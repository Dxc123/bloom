import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bl_me_recharge_controller.dart';

class BlMeRechargeView extends GetView<BlMeRechargeController> {
  const BlMeRechargeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlMeRechargeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BlMeRechargeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
