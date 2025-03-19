import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlConversationActionDialog extends StatefulWidget {
  const BlConversationActionDialog({
    super.key,
    required this.onClear,
    required this.onRead,
  });
  final Function onClear;
  final Function onRead;

  @override
  State<BlConversationActionDialog> createState() => _BlConversationActionDialogState();

  static Future showDialog({required Function onClear, required Function onRead}) {
    return Get.dialog(
      BlConversationActionDialog(onClear: onClear, onRead: onRead),
      useSafeArea: false,
    );
  }
}

class _BlConversationActionDialogState extends State<BlConversationActionDialog> {
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
                  widget.onRead();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Set Read",
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
                  widget.onClear();
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 15),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "Clear Message",
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
