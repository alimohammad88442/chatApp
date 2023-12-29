import 'package:firebase_chat/pages/signin/controller.dart';
import 'package:get/get.dart';

class SinginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SinginController>((() => SinginController()));
  }
}
