import 'package:firebase_chat/pages/application/widgets/application_bottomNavigationBar.dart';
import 'package:firebase_chat/pages/application/widgets/application_pagebody.dart';

import 'index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApplicationPageBody(controllerl: controller),
      bottomNavigationBar: ApplicationBottomNavigationBar(controllerl: controller),
    );
  }
}




