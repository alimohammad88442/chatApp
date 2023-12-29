import 'package:get/get.dart';
import 'index.dart';


class ProfileBinfings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>((() => ProfileController()));
  }
}
