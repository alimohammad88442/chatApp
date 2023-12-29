import 'package:firebase_chat/common/values/values.dart';
import 'package:firebase_chat/pages/messages/chat/index.dart';
import 'package:firebase_chat/pages/messages/chat/widgets/chat_left_item.dart';
import 'package:firebase_chat/pages/messages/chat/widgets/chat_right_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColors.chatbg,
        padding: EdgeInsets.only(bottom: 50.h),
        child: CustomScrollView(
          reverse: true,
          controller: controller.messagescrolling,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  var item = controller.state.msgContentList[index];
                  if (controller.userId == item.uid) {
                    return ChatrightItem(item: item);
                  }
                  return ChatLeftItem(item: item);
                }, childCount: controller.state.msgContentList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
