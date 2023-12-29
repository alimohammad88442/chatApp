import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key, required this.onpressed});
  final  void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 280.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'sign in with social network',
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.w, right: 50.w, left: 50.w),
            child: btnFlatButtonWidget(
                onPressed: onpressed,
                  
                
                title: 'google login ',
                width: 200.w,
                height: 55.h),
          )
        ],
      ),
    );
  }
}
