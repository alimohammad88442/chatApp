import 'package:firebase_chat/pages/application/index.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/messages/view.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:flutter/material.dart';

class ApplicationPageBody extends StatelessWidget {
  const ApplicationPageBody({super.key, required this.controllerl});
  final ApplicationController controllerl;
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controllerl.pageController,
      onPageChanged: controllerl.handlePageChanged,
      children: const [
        MesssagPage(),
     ContactPage(),
        ProfilePage(),
      ],
    );
  }
}