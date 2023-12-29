
import 'package:firebase_chat/pages/contact/widgets/contact_appbar.dart';
import 'package:firebase_chat/pages/contact/widgets/contact_list.dart';

import 'index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  ContactAppBar(),
      body: ContactList(controller: controller),
     
    );
  }
}




