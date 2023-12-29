import 'package:firebase_chat/common/routes/routes.dart';
import 'package:firebase_chat/common/store/config.dart';
import 'package:firebase_chat/pages/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  changPage(int index) async {
    state.index.value = index;
  }

  handleSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.signIn);
  }
}
