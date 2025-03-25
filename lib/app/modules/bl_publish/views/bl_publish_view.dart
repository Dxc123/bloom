import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/bl_components/bl_net_image.dart';
import '../controllers/bl_publish_controller.dart';

class BlPublishView extends StatefulWidget {
  const BlPublishView({super.key});

  @override
  State<BlPublishView> createState() => _BlPublishViewState();
}

class _BlPublishViewState extends State<BlPublishView> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(BlPublishController());

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    Get.delete<BlPublishController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 180,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: Image.asset(
            "assets/images/app/bl_publish_title.png",
            fit: BoxFit.cover,
            width: 80,
            height: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        controller.picList;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 120),
            ),
            SliverToBoxAdapter(
              child: buildTfWidget(),
            ),
            SliverToBoxAdapter(
              child: buildCenterPickPicWidget(),
            ),
            SliverToBoxAdapter(
              child: buildBottomTextWidget(),
            ),
            SliverToBoxAdapter(
              child: buildConfirmWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        );
      }),
    );
  }

  Widget buildCenterPickPicWidget() {
    return Obx(() {
      if (controller.picList.isNotEmpty) {
        return Container(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          height: 107,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: controller.picList.length + 1,
              itemBuilder: (context, index) {
                if (index == controller.picList.length) {
                  return InkWell(
                    onTap: () {
                      controller.onPickPic();
                    },
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(start: 10),
                      width: 107,
                      height: 107,
                      alignment: AlignmentDirectional.center,
                      child: Image.asset(
                        "assets/images/app/bl_publish_pic_holder.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
                final pic = controller.picList[index];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(end: 10),
                      width: 107,
                      height: 107,
                      child: BlImageNetwork(
                        url: pic,
                        width: 107,
                        height: 107,
                        borderRadius: BorderRadius.circular(10),
                        placeholder: "assets/images/app/bl_publish_pic_holder.png",
                      ),
                    ),
                    PositionedDirectional(
                        end: 15,
                        top: 5,
                        child: InkWell(
                          onTap: () {
                            controller.picList.removeAt(index);
                            controller.update();
                          },
                          child: Image.asset(
                            "assets/images/app/bl_publish_delete.png",
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                );
              }),
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.onPickPic();
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
                width: 107,
                height: 107,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF1F3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.asset(
                  "assets/images/app/bl_publish_pic_holder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 100,
              height: 100,
            )
          ],
        );
      }
    });
  }

  Widget buildConfirmWidget() {
    return InkWell(
      onTap: () {
        controller.onPublish();
      },
      child: Container(
        height: 52,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(26),
          color: controller.isCanSend.value ? Color(0xFFF95AAA) : Color(0xFFF95AAA).withOpacity(0.3),
        ),
        child: Text(
          "Release",
          style: TextStyle(
            fontSize: 22,
            color: controller.isCanSend.value ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF).withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget buildBottomTextWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
      child: const Column(
        children: [
          Text(
            "1.Do not publish obscenity, pornography, gambling, violence, homicide, terror, or content that instigates crime, insults or slanders others.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "2.Do not publish that misleads minors,violates the legal rights of minors or harms the physical and mental health of minors.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "3.Do not publish without the permission of others, secretly photographing, secretly recording others, infringing on the legal rights of others.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "4.Do not publish content infringing others' legal rights such as reputation rights, portrait rights, intellectual property rights, trade secrets, etc.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "5.Do not publish content involving other people’s privacy, personal information or data.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "6.Do not post false or misleading information,deceive or mislead other users.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "7.Do not post offensive information, data, text, software, music, photos, graphics, information or other materials.",
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildTfWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller.contentController,
        focusNode: controller.contentFocusNode,
        decoration: const InputDecoration(
          hintText: "Share your favorite perfume for everyone...",
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Color(0xFF999999),
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        keyboardType: TextInputType.text,
        maxLines: 5,
        maxLength: 300,
        textAlign: TextAlign.start,
        // autofocus: true,
        // showCursor: false,
        onChanged: (value) {
          controller.isCanSend.value = value.isNotEmpty;
        },
        onSubmitted: (value) {
          //TODO
        },
        onTap: () {
          //TODO
        },
      ),
    );
  }
}
