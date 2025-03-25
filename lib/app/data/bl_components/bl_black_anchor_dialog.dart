import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BlBlackType { blackAnchor, blackMedia }

class BlBlackAnchorDialog extends StatefulWidget {
  const BlBlackAnchorDialog({
    super.key,
    this.type = BlBlackType.blackAnchor,
    required this.onBlack,
  });
  final BlBlackType type;
  final Function() onBlack;

  @override
  State<BlBlackAnchorDialog> createState() => _BlBlackAnchorDialogState();
  static Future showDialog({
    required BlBlackType type,
    required Function() onBlack,
  }) {
    return Get.dialog(
      BlBlackAnchorDialog(type: type, onBlack: onBlack),
      useSafeArea: false,
    );
  }
}

class _BlBlackAnchorDialogState extends State<BlBlackAnchorDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
              alignment: AlignmentDirectional.center,
              child: Column(
                children: [
                  Text(
                    widget.type == BlBlackType.blackAnchor ? "Blacklist users" : "Blacklist resources",
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.type == BlBlackType.blackAnchor
                        ? "After blocking, the other party will no longer see your updates and will not be able to view your updates."
                        : "After blocking, the other party will no longer see your resources and will not be able to view your resources.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  //   确定按钮
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE8E7E7), width: 2),
                      borderRadius: BorderRadiusDirectional.circular(12),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                        widget.onBlack.call();
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  //   取消按钮，带边框
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black,
                        ],
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(16),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PositionedDirectional(
                end: 24 + 15,
                top: 5,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
