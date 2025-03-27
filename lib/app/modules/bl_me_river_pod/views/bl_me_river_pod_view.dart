import 'package:bloom/app/modules/bl_me_river_pod/bl_riverpod/bl_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';

import '../../../../bl_app/models/app_info_entity.dart';
import '../controllers/bl_me_river_pod_controller.dart';

class BlMeRiverPodView extends ConsumerStatefulWidget {
  const BlMeRiverPodView({super.key});

  @override
  ConsumerState createState() => _BlMeRiverPodViewState();
}

class _BlMeRiverPodViewState extends ConsumerState<BlMeRiverPodView> {
  final controller = BlMeRiverPodController();

  @override
  void dispose() {
    Get.delete<BlMeRiverPodController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppInfoDetailEntity? userInfo = ref.watch(userInfoServiceProvider).value;
    return Scaffold(
        appBar: AppBar(
          title: const Text('BlMeRiverPodView'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            Text('name:${userInfo?.nickname ?? "nickname"}'),
            const SizedBox(height: 20),
            Text('userId:${userInfo?.userId ?? 0}'),
          ],
        )));
  }
}
