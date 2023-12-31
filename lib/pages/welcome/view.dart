import 'package:firebase_chat/common/widgets/dots_indicator.dart';
import 'package:firebase_chat/pages/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: 361.w,
          height: 780.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index) {
                  controller.changPage(index);
                },
                controller: PageController(
                  initialPage: 3,
                  keepPage: false,
                  viewportFraction: 1,
                ),
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/banner1.png'))),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/banner2.png'))),
                  ),
                  Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/banner3.png'))),
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Positioned(
                            bottom: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.handleSignIn();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                    const BorderSide(color: Colors.white)),
                              ),
                              child: const Text('login'),
                            ))
                      ])),
                ],
              ),
              Positioned(
                  bottom: 70,
                  child: DotsIndicatoritem(
                    controller: controller,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
