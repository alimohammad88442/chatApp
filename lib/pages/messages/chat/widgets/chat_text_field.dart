import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/messages/chat/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key, required this.controller});
  final ChatController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 50.h,
      color: AppColors.primaryBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 217.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              controller: controller.textControler,
              autofocus: false,
              focusNode: controller.contentNode,
              decoration: const InputDecoration(
                hintText: 'Send',
              ),
            ),
          ),
          Container(
            height: 30.h,
            width: 30.w,
            margin: EdgeInsets.only(left: 5.w),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.photo_outlined, size: 35.w, color: Colors.blue),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 5.h),
            width: 65.w,
            height: 35.w,
            child: ElevatedButton(
                onPressed: () {
                  controller.sendMessage();
                },
                child: const Text('send')),
          )
        ],
      ),
    );
  }
}