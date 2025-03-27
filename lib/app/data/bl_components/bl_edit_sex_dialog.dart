import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlEditSexDialog extends StatefulWidget {
  final int? sex;
  final Function(int) callback;

  const BlEditSexDialog({
    super.key,
    required this.sex,
    required this.callback,
  });

  @override
  State<BlEditSexDialog> createState() => _BlEditSexDialogState();

  static Future showDialog({required int sex, required Function(int) callback}) {
    return Get.dialog(BlEditSexDialog(
      sex: sex,
      callback: callback,
    ));
  }
}

class _BlEditSexDialogState extends State<BlEditSexDialog> {
  var genderNow = 0.obs;

  @override
  void initState() {
    super.initState();
    genderNow.value = widget.sex ?? 0;
  }

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
      Container(
        height: 260,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Text(
            "Change gender",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Gender can only be changed once",
            style: TextStyle(
              color: Color(0xFF969696),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      genderNow.value = 1;
                    },
                    child: Container(
                      width: 145,
                      height: 62,
                      decoration: BoxDecoration(
                        // image: genderNow.value == 1
                        //     ? const DecorationImage(
                        //         image: AssetImage("assets/images/app/app_dialog_sex_item_male_select.webp"),
                        //         fit: BoxFit.fill,
                        //       )
                        //     : const DecorationImage(
                        //         image: AssetImage("assets/images/app/app_dialog_sex_item.webp"),
                        //         fit: BoxFit.fill,
                        //       ),
                        borderRadius: BorderRadius.circular(62 / 2),
                        color: genderNow.value == 1 ? const Color(0xFF65DAFF) : const Color(0xFFF2F2F2),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            genderNow.value == 1 ? "assets/images/app/bl_dialog_sex_male_select.webp" : "assets/images/app/bl_dialog_sex_male.webp",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: genderNow.value == 1 ? Colors.white : const Color(0xFFAEADB5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      genderNow.value = 2;
                    },
                    child: Container(
                      width: 145,
                      height: 62,
                      decoration: BoxDecoration(
                        // image: genderNow.value == 2
                        //     ? const DecorationImage(
                        //         image: AssetImage("assets/images/app/app_dialog_sex_item_female_select.webp"),
                        //         fit: BoxFit.fill,
                        //       )
                        //     : const DecorationImage(
                        //         image: AssetImage("assets/images/app/app_dialog_sex_item.webp"),
                        //         fit: BoxFit.fill,
                        //       ),
                        borderRadius: BorderRadius.circular(62 / 2),
                        color: genderNow.value == 2 ? const Color(0xFFFF65CE) : const Color(0xFFF2F2F2),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            genderNow.value == 2 ? "assets/images/app/bl_dialog_sex_female_select.webp" : "assets/images/app/bl_dialog_sex_female.webp",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: genderNow.value == 2 ? Colors.white : const Color(0xFFAEADB5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Get.back();
              widget.callback(genderNow.value);
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3BE2F5),
                      Color(0xFF3BE2F5),
                    ],
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                  )),
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: const Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ]),
      )
    ]);
  }
}
