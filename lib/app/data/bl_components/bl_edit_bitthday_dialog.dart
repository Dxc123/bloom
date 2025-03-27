import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';

class BlEditBirthdayDialog extends StatefulWidget {
  final int? birthday;
  const BlEditBirthdayDialog({
    super.key,
    required this.birthday,
  });

  @override
  State<BlEditBirthdayDialog> createState() => _BlEditBirthdayDialogState();

  static Future<void> showDialog({required int birthday, required Function callback}) {
    // return Get.dialog(BlEditBirthdayDialog(birthday: birthday));
    DateTime? birthday22 = DateTime.fromMillisecondsSinceEpoch(birthday);
    DateTime dateTime = DateTime.now();
    return DatePicker.showDatePicker(
      Get.context!,
      showTitleActions: true,
      minTime: DateTime(dateTime.year - 60, dateTime.month, dateTime.day),
      maxTime: DateTime(dateTime.year - 18, dateTime.month, dateTime.day),
      onChanged: (date) {},
      onConfirm: (date) {
        callback(date.millisecondsSinceEpoch);
      },
      currentTime: birthday22,
      // locale: currentUerLanguageType,
    );
  }
}

class _BlEditBirthdayDialogState extends State<BlEditBirthdayDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset(
          "assets/images/app/bl_dialog_arrow_down.webp",
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 15),
      // Container(
      //   height: 250,
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadiusDirectional.only(
      //       topStart: Radius.circular(16),
      //       topEnd: Radius.circular(16),
      //     ),
      //   ),
      //   alignment: AlignmentDirectional.center,
      //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 15),
      // )
    ]);
  }
}
