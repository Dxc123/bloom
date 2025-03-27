import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/bl_repository/bl_repository_manager.dart';
import 'app/data/bl_service/bl_device_Info_service.dart';
import 'app/data/bl_service/bl_load_data_service.dart';
import 'app/data/bl_service/bl_my_info_service.dart';
import 'app/data/bl_untils/bl_loading.dart';
import 'app/data/bl_untils/bl_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlLoading.initCustomConfig();
  await GetStorage.init();
  BlStorage.initStorage();
  await Get.putAsync<BlDeviceInfoService>(() => BlDeviceInfoService().init());
  await Get.putAsync<AppMyInfoService>(() => AppMyInfoService().init());
  await Get.putAsync<BlLoadDataService>(() => BlLoadDataService().init());
  await Get.putAsync<BlRepositoryManager>(() => BlRepositoryManager().init());
  runApp(
    ProviderScope(
      child: GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: GetPlatform.isIOS == true ? false : true,
            body: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: const EdgeInsetsDirectional.only(bottom: 0),
              child: GestureDetector(
                onTap: () {
                  if (GetPlatform.isIOS) appGlobalHideKeyboard();
                },
                child: EasyLoading.init()(
                  context,
                  child,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

//关闭键盘
void appGlobalHideKeyboard({Function? callBack}) {
  FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
    Future.delayed(const Duration(milliseconds: 250), () {
      callBack?.call();
    });
  } else {
    callBack?.call();
  }
}
