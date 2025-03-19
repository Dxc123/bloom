import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlChatActionDialog extends StatefulWidget {
  const BlChatActionDialog({
    super.key,
    required this.onReport,
    required this.onBlack,
    required this.onFollow,
    required this.onClearMsg,
  });
  final Function onReport;
  final Function onBlack;
  final Function onFollow;
  final Function onClearMsg;
  @override
  State<BlChatActionDialog> createState() => _BlChatActionDialogState();

  static Future showDialog({
    required Function onReport,
    required Function onBlack,
    required Function onFollow,
    required Function onClearMsg,
  }) {
    return Get.dialog(
      BlChatActionDialog(
        onReport: onReport,
        onBlack: onBlack,
        onFollow: onFollow,
        onClearMsg: onClearMsg,
      ),
      useSafeArea: false,
    );
  }
}

class _BlChatActionDialogState extends State<BlChatActionDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              )),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                  widget.onReport.call();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Report",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
                child: const Divider(
                  color: Color(0xFFEDEDED),
                  height: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  widget.onBlack.call();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Black",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
                child: const Divider(
                  color: Colors.black12,
                  height: 1,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Get.back();
              //     widget.onFollow.call();
              //   },
              //   child: Container(
              //     margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
              //     alignment: AlignmentDirectional.center,
              //     child: const Text(
              //       "Follow",
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
                child: const Divider(
                  color: Color(0xFFEDEDED),
                  height: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  widget.onClearMsg.call();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Clear chat history",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 0),
                color: const Color(0xFFEDEDED),
                height: 6,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}
