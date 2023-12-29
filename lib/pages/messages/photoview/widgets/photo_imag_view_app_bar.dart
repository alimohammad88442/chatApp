import 'package:firebase_chat/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoImageViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PhotoImageViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColors.secondaryElement,
            height: 2.0,
          ),
        ),
        title: Text(
          'Photo View',
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}