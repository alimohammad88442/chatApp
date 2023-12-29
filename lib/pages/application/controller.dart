import 'package:firebase_chat/common/values/values.dart';
import 'package:flutter/material.dart';

import 'index.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();
  late final List<String> tabTitle;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomtabs;
  void handlePageChanged(int index) {
    state.page = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabTitle = ['caht', 'contact', 'profile'];
    bottomtabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
            color: AppColors.thirdElement,
          ),
          activeIcon: Icon(
            Icons.message,
            color: AppColors.secondaryElementText,
          ),
          label: 'caht',
          backgroundColor: AppColors.primaryBackground),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.contact_page,
            color: AppColors.thirdElement,
          ),
          activeIcon: Icon(
            Icons.contact_page,
            color: AppColors.secondaryElementText,
          ),
          label: 'contact',
          backgroundColor: AppColors.primaryBackground),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: AppColors.thirdElement,
          ),
          activeIcon: Icon(
            Icons.person,
            color: AppColors.secondaryElementText,
          ),
          label: 'person',
          backgroundColor: AppColors.primaryBackground),
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
