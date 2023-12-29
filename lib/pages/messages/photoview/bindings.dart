import 'package:get/get.dart';
import 'index.dart';
class PhotoImageViewBindins implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }
}
