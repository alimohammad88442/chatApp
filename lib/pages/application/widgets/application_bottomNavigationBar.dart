

import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/application/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ApplicationBottomNavigationBar extends StatelessWidget {
  const ApplicationBottomNavigationBar({super.key, required this.controllerl});
  final ApplicationController controllerl;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        items: controllerl.bottomtabs,
        currentIndex: controllerl.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controllerl.handleNavBarTap,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: AppColors.tabBarElement,
        selectedItemColor: AppColors.thirdElementText,

      ),
    );
  }
}
