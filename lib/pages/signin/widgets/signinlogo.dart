import 'package:firebase_chat/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninLogo extends StatelessWidget {
  const SigninLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 110.w,
      margin: EdgeInsets.only(top: 84.h ,),
      child: Column(
        children: [
          Container(
            width: 76.w,
            height: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Positioned(child: Container(
                  height: 76.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBackground,
                    boxShadow: [
                      Shadows.primaryShadow
                    ],
                    borderRadius:BorderRadius.all(Radius.circular(35 ))
                  ),
                )),
                Positioned(child: Image.asset('assets/images/ic_launcher.png',width: 76.w, height: 76.w, fit: BoxFit.cover,))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h , bottom: 15.h),
            child:Text(
              "let's chat",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.thirdElement,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                height: 1
              ),
              ) ,
          )
        ],
      ),
    );
  }
}