import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 0:退出登录 1:注销 2:拉黑主播
enum BlDialogType {
  logout,
  cancellation,
  blackAnchor,
}

class BlLogoutDialogView extends StatefulWidget {
  final Function callback;
  final BlDialogType type;
  const BlLogoutDialogView({
    super.key,
    this.type = BlDialogType.logout,
    required this.callback,
  });

  @override
  State<BlLogoutDialogView> createState() => _BlLogoutDialogViewState();

  static void show({required BlDialogType type, required Function callback}) {
    Get.dialog(
      BlLogoutDialogView(
        type: type,
        callback: callback,
      ),
    );
  }
}

class _BlLogoutDialogViewState extends State<BlLogoutDialogView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        width: 316,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.type == BlDialogType.logout ? "Warm tips" : (widget.type == BlDialogType.cancellation ? "Are you sure you want to delete your account?" : "Warm tips"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1D0147),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
                    child: Text(
                      widget.type == BlDialogType.logout
                          ? "Are you sure you want to log out?"
                          : (widget.type == BlDialogType.cancellation
                          ? "1.Please note that deleting your account will completely erase your data and there is no way to restore the account or reuse it after deletion.\n\n2.After deleting your account, all your assets in the app will be destroyed!"
                          : "Are you sure you want to block this user?"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF1D0147).withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 56,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        color: const Color(0xFFF0F0F0),
                      ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                widget.callback.call();
                              },
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  color: const Color(0xFF1D0147).withOpacity(0.5),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Color(0xFF1D0147),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PositionedDirectional(
                    start: 0,
                    end: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Container(
                        width: 1,
                        color: const Color(0xFFF0F0F0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
