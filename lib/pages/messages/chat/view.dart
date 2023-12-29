import 'package:firebase_chat/pages/messages/chat/widgets/chat_appbar.dart';
import 'package:firebase_chat/pages/messages/chat/widgets/chat_list.dart';
import 'package:firebase_chat/pages/messages/chat/widgets/chat_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});
  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading:const Icon(Icons.photo_library),
                title:const Text('Gallery'),
                onTap: () {
                  controller.imgFromGalley();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('camera'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        controller: controller,
      ),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: [
              const ChatList(),
              Positioned(
                  bottom: 0.h,
                  height: 50.h,
                  child: ChatTextField(controller: controller)),
            ],
          ),
        ),
      ),
    );
  }
}
