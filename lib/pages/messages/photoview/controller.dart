import 'package:get/get.dart';
import 'index.dart';

class PhotoImageViewController extends GetxController {
  final PhotoImageViewState state = PhotoImageViewState();
  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    if (data['url'] != null) {
      state.url.value = data['url']!;
    }
  }
}
