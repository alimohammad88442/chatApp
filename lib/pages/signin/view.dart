import 'package:firebase_chat/pages/signin/controller.dart';
import 'package:firebase_chat/pages/signin/widgets/signinbody.dart';
import 'package:firebase_chat/pages/signin/widgets/signinlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinginPage extends GetView<SinginController> {
  const SinginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SigninLogo(),
        const Spacer(),
        SigninBody(
          onpressed: () {
            controller.handleSignin();
          },
        ),
      ],
    ),);
  }
}
