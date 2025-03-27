import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlEditNameDialogView extends StatefulWidget {
  final String? nickName;
  final Function(String)? callback;

  const BlEditNameDialogView({
    super.key,
    required this.nickName,
    required this.callback,
  });

  static Future showDialog({
    required String nickName,
    required Function(String) callback,
  }) {
    return Get.bottomSheet(
      BlEditNameDialogView(
        nickName: nickName,
        callback: callback,
      ),
    );
  }

  @override
  State<BlEditNameDialogView> createState() => _TrEditNameDialogState();
}

class _TrEditNameDialogState extends State<BlEditNameDialogView> {
  TextEditingController nameTextController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  var maxLen = 30;
  var name = "";

  @override
  void initState() {
    super.initState();
    name = (widget.nickName ?? "").replaceAll(RegExp(r"\d"), "*");
    // nameFocusNode.requestFocus();
    nameTextController.text = name;
    nameTextController.addListener(() {
      if ((nameTextController.text.length) > maxLen) {
        nameTextController.text = nameTextController.text.substring(0, maxLen);
        nameTextController.selection = TextSelection(
          baseOffset: nameTextController.text.length,
          extentOffset: nameTextController.text.length,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var lengthRx = nameTextController.text.length.obs;

    return SingleChildScrollView(
      primary: true,
      reverse: true,
      physics: const BouncingScrollPhysics(),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          // child: Image.asset(
          //   "assets/images/app/wi_dialog_arrow_down.png",
          //   fit: BoxFit.cover,
          // ),
          child: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: 40,
          ),
        ),

        Container(
          height: 250,
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
              "Enter nickname",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: TextField(
                controller: nameTextController,
                focusNode: nameFocusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter nickname",
                  hintStyle: TextStyle(
                    color: Color(0xFFB2B2B2),
                    fontSize: 14,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // maxLength: 20,
                textAlign: TextAlign.start,
                // autofocus: true,
                // showCursor: false,
                onChanged: (value) {
                  lengthRx.value = value.length;
                },
                onSubmitted: (value) {
                  //TODO
                },
                onTap: () {
                  //TODO
                },
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Get.back();
                widget.callback?.call(nameTextController.text);
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF95AAA),
                        Color(0xFFF95AAA),
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
      ]),
    );
  }
}
