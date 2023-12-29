import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_chat/common/entities/user.dart';
import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactListBody extends StatelessWidget {
  const ContactListBody({super.key, required this.item, required this.controller});
  final UserData item;
  final ContactController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
      child: InkWell(
        onTap: () {
          if (item.id !=null) {
            controller.goChat(item); 
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, left: 0.w, right: 15.w),
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                child: CachedNetworkImage(imageUrl: ' ${item.photourl}'),
              ),
            ),
            Container(
              width: 250.w,
              padding: EdgeInsets.only(
                  top: 15.w, left: 0.w, right: 0.w, bottom: 0.w),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0Xffe5e5e5)))),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 43.w,
                    child: Text(
                      item.name ?? '',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold,
                          color: AppColors.thirdElement,
                          fontSize: 16.sp),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
