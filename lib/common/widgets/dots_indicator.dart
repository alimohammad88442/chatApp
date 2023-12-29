import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:flutter/widgets.dart';

class DotsIndicatoritem extends StatelessWidget {
  const DotsIndicatoritem({super.key, required this.controller});
  final WelcomeController controller;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
                  position: controller.state.index.value,
                  dotsCount: 3,
                  reversed: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      size: const Size.square(9),
                      activeSize: const Size(18, 9),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                );
  }
}