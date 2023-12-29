
import 'package:firebase_chat/pages/messages/chat/widgets/messages_list_item.dart';
import 'package:firebase_chat/pages/messages/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagesList extends GetView<MessagesController> {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onLoading: controller.onLoading,
        onRefresh: controller.onRefresh,
        controller: controller.refreshController,
        header: const WaterDropHeader(),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var item = controller.state.msgList[index];
                return MessagesListItem(
                  item: item,
                  controller: controller,
                );
              }, childCount: controller.state.msgList.length)),
            ),
          ],
        ),
      ),
    );
  }
}


