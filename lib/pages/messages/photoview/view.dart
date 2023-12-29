import 'package:firebase_chat/pages/messages/photoview/widgets/photo_imag_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'index.dart';

class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PhotoImageViewAppBar(),
      body: Container(
        child:
            PhotoView(imageProvider: NetworkImage(controller.state.url.value)),
      ),
    );
  }
}
