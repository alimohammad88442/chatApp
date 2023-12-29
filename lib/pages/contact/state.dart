import 'package:firebase_chat/common/entities/entities.dart';
import 'package:get/get.dart';

class ContactState {
  final count = 0.obs;
  RxList<UserData> contactList = <UserData>[].obs;
}
