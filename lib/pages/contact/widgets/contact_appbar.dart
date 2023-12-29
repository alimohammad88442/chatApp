import 'package:firebase_chat/common/values/values.dart';
import 'package:firebase_chat/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ContactAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return transparentAppBar(
      title: Text('contact', style: TextStyle(color: AppColors.primaryBackground , fontSize: 10.sp , fontWeight: FontWeight.w600),),

      
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}