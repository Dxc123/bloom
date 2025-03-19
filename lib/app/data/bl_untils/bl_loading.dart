import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BlLoading {
  ///自定义全局 Loading
  static void initCustomConfig() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..lineWidth = 2
      ..radius = 10.0
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..progressColor = Colors.white
      ..backgroundColor = Colors.white.withOpacity(0.3)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.custom;
  }

  static void showLoading({
    String? text,
    bool dismissOnTap = true,
  }) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.instance.dismissOnTap = dismissOnTap;
    EasyLoading.show(status: text ?? "loading...");
  }

  static void toast(
      String text, {
        Duration? duration,
      }) {
    EasyLoading.showToast(text);
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }

  static void showToast(
      String text, {
        int milliseconds = 1500,
        Function? toastDisappear,
      }) {
    EasyLoading.showToast(
      text,
      duration: Duration(milliseconds: milliseconds),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: false,
    );
    if (toastDisappear != null) {
      Future.delayed(Duration(milliseconds: milliseconds), () {
        toastDisappear.call();
      });
    }
  }
}
