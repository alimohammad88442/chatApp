import 'package:firebase_chat/pages/contact/controller.dart';
import 'package:firebase_chat/pages/messages/controller.dart';
import 'package:firebase_chat/pages/profile/controller.dart';
import 'package:get/get.dart';
import 'index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>((() => ApplicationController()));
     Get.lazyPut<ContactController>((() => ContactController()));
     Get.lazyPut<MessagesController>((() => MessagesController()));
     Get.lazyPut<ProfileController>((() => ProfileController()));

  }
}
