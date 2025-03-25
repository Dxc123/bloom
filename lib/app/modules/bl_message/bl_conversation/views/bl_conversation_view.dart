import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/bl_components/bl_conversation_action_dialog.dart';
import '../../../../data/bl_components/bl_empty_view.dart';
import '../../../../data/bl_repository/bl_message/bl_message_repository.dart';
import '../../../../data/bl_repository/bl_message/entity/bl_conversation_entity.dart';
import '../../../../data/bl_repository/bl_message/entity/bl_message_entity.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/bl_conversation_controller.dart';

class BlConversationView extends StatefulWidget {
  const BlConversationView({super.key});

  @override
  State<BlConversationView> createState() => _BlConversationViewState();
}

class _BlConversationViewState extends State<BlConversationView> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(BlConversationController());

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    Get.delete<BlConversationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Obx(() {
          return CustomScrollView(
            slivers: [
              controller.conversationLists.isNotEmpty
                  ? SliverPadding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          final item = controller.conversationLists[index];
                          return Container(
                            height: 80,
                            margin: const EdgeInsetsDirectional.only(bottom: 10),
                            child: Slidable(
                              key: ValueKey("${item.anchorUserId}_$index"),
                              endActionPane: ActionPane(
                                extentRatio: 0.25,
                                motion: const ScrollMotion(),
                                children: [
                                  const SizedBox(width: 22, height: 20),
                                  CustomSlidableAction(
                                    flex: 1,
                                    // backgroundColor: const Color(0xFFFF5A5F).withOpacity(0.3),
                                    // padding: const EdgeInsets.all(10),
                                    // borderRadius: BorderRadius.circular(16),
                                    onPressed: (BuildContext context) {
                                      debugPrint("移除会话");
                                      controller.onDeleteConversation(item);
                                    },
                                    child: Image.asset(
                                      "assets/images/app/bl_conversation_delete.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  debugPrint("点击去聊天");
                                  Get.toNamed(Routes.BL_CHAT, arguments: item);
                                },
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(25),
                                            child: Image.asset(
                                              item.anchorAvatar ?? "",
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          // HcImageNetwork(
                                          //   url: item.anchorAvatar ?? "",
                                          //   width: 50,
                                          //   height: 50,
                                          //   borderRadius: BorderRadius.circular(25),
                                          // ),
                                          const SizedBox(width: 5),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                item.anchorNickname ?? "",
                                                style: const TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              NewConversationContentWidget(item: item),
                                            ],
                                          )
                                        ],
                                      ),
                                      Text(
                                        DateFormat('yyyy-MM-dd').format(
                                          DateTime.fromMillisecondsSinceEpoch(item.createdAt ?? 0),
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xFF878787),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: controller.conversationLists.length,
                      )))
                  : SliverToBoxAdapter(
                child: BlEmptyView(onRefresh: () {}),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: Get.bottomBarHeight + 100),
              )
            ],
          );
        }),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: const Text(
        'Message',
        style: TextStyle(
          color: Color(0xFF181818),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            BlConversationActionDialog.showDialog(onClear: () {
              controller.onClearConversation();
            }, onRead: () {
              controller.onReadConversation();
            });
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Center(
                child: Image.asset(
                  "assets/images/app/bl_nav_more_detail.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class NewConversationContentWidget extends StatefulWidget {
  const NewConversationContentWidget({
    super.key,
    required this.item,
  });

  final BlConversationDB item;

  @override
  State<NewConversationContentWidget> createState() => _NewConversationContentWidgetState();
}

class _NewConversationContentWidgetState extends State<NewConversationContentWidget> {
  BlMessageDB? _chatMessage;
  StreamSubscription<List<BlMessageDB>>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = BlMessageRepository.to.queryMessageStreamByConversationId(
        conversationId: widget.item.id,
        callback: (event) {
          debugPrint("刷新文本消息");
          if (mounted == true) {
            setState(() {
              _chatMessage = event.isNotEmpty ? event.first : null;
            });
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("刷新文本消息 = ${_chatMessage?.msgType ?? ""}");
    return _chatMessage?.msgType == MsgTypeEnum.text || _chatMessage?.msgType == null
        ? LimitedBox(
      maxWidth: Get.width - 12 * 2 - 12 * 2 - 50 - 50,
      child: Text(
        _chatMessage?.text ?? "",
        maxLines: 1,
        style: const TextStyle(
          color: Color(0xFF666666),
          fontSize: 13,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    )
        : Image.asset(
      "assets/images/app/bl_conversation_gift.png",
      fit: BoxFit.cover,
    );
  }
}
