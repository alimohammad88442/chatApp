import 'dart:convert';

import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/routes/routes.dart';
import 'package:firebase_chat/common/store/user.dart';
import 'package:firebase_chat/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  final ProfileState state = ProfileState();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'http://www.googleapis.com/auth/contacts.readonly'
  ]);
  asyncLoadAllData() async {
    String profile = await UserStore.to.getProfile();
    if (profile.isNotEmpty) {
      UserLoginResponseEntity userdata =
          UserLoginResponseEntity.fromJson(jsonDecode(profile));
      state.headDetail.value = userdata;
    }
  }

  Future<void> onLogOut() async {
    UserStore.to.onLogout();
    await googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.signIn);
  }

  @override
  void onInit() {
    super.onInit();
    asyncLoadAllData();
    List MyList = [
      {'name': 'Account', 'icon': 'assets/icons/1.png', 'route': 'account'},
      {'name': 'chat', 'icon': 'assets/icons/2.png', 'route': 'chat'},
      {
        'name': 'Notification',
        'icon': 'assets/icons/3.png',
        'route': 'notification'
      },
      {'name': 'Privacy', 'icon': 'assets/icons/4.png', 'route': '/privacy'},
      {'name': 'Help', 'icon': 'assets/icons/5.png', 'route': '/help'},
      {'name': 'About', 'icon': 'assets/icons/6.png', 'route': '/about'},
      {'name': 'Logout', 'icon': 'assets/icons/7.png', 'route': '/logout'},
    ];
    for (var i = 0; i < MyList.length; i++) {
      MeListItem result = MeListItem();
      result.icon = MyList[i]['icon'];
      result.name = MyList[i]['name'];
      result.route = MyList[i]['route'];
      state.melistitem.add(result);
    }
  }
}
