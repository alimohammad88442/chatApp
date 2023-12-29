
import 'package:firebase_chat/pages/profile/controller.dart';
import 'package:firebase_chat/pages/profile/widgets/head_item.dart';
import 'package:firebase_chat/pages/profile/widgets/me_item.dart';
import 'package:firebase_chat/pages/profile/widgets/profile_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverToBoxAdapter(
                child: controller.state.headDetail.value == null
                    ? Container()
                    : HeadItem(
                        item: controller.state.headDetail.value!,
                      ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  var item = controller.state.melistitem[index];
                  return MeItem(item: item , controller: controller,);
                }, childCount: controller.state.melistitem.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



