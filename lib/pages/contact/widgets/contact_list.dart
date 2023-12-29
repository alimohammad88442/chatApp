
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/contact/widgets/contact_list-body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.controller});
  final ContactController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var item = controller.state.contactList[index];
                  return ContactListBody(item: item, controller: controller,);
                },
                childCount: controller.state.contactList.length,
              )),
            )
          ],
        ));
  }
}


