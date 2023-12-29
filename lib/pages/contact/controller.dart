import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/store/user.dart';
import 'package:firebase_chat/pages/contact/index.dart';

import 'package:get/get.dart';

class ContactController extends GetxController {
  ContactController();
  final ContactState state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;
  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  goChat(UserData toUserData) async {
    var formMessages = await db
        .collection('message')
        .withConverter(
            //form map to object
            fromFirestore: Msg.fromFirestore,
            //form object to map
            toFirestore: (Msg msg, options) {
              return msg.toFirestore();
            })
        .where('form_uid', isEqualTo: token)
        .where('to_uid', isEqualTo: toUserData.id)
        .get();
    var toMessages = await db
        .collection('message')
        .withConverter(
            //form map to object
            fromFirestore: Msg.fromFirestore,
            //form object to map
            toFirestore: (Msg msg, options) {
              return msg.toFirestore();
            })
        .where('form_uid', isEqualTo: toUserData)
        .where('to_uid', isEqualTo: token)
        .get();
    if (formMessages.docs.isEmpty && toMessages.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      UserLoginResponseEntity userdata =
          UserLoginResponseEntity.fromJson(jsonDecode(profile));
      var msgData = Msg(
        fromUid: userdata.accessToken,
        toUid: toUserData.id,
        fromName: userdata.displayName,
        toName: toUserData.name,
        fromAvatar: userdata.photoUrl,
        toAvatar: toUserData.photourl,
        lastMsg: '',
        lastTime: Timestamp.now(),
        msgNum: 0,
      );
      db
          .collection('message')
          .withConverter(
              fromFirestore: Msg.fromFirestore,
              toFirestore: (Msg msg, option) {
                return msg.toFirestore();
              })
          .add(msgData)
          .then((value) {
        Get.toNamed('/chat', parameters: {
          'doce_id': value.id,
          'to_uid': toUserData.id ?? '',
          'to_name': toUserData.name ?? '',
          'to_avatar': toUserData.photourl ?? ''
        });
      });
    } else {
      if (formMessages.docs.isNotEmpty) {
        Get.toNamed('/chat', parameters: {
          'doce_id': formMessages.docs.first.id,
          'to_uid': toUserData.id ?? '',
          'to_name': toUserData.name ?? '',
          'to_avatar': toUserData.photourl ?? ''
        });
      }
      if (toMessages.docs.isNotEmpty) {
        Get.toNamed('/chat', parameters: {
          'doce_id': toMessages.docs.first.id,
          'to_uid': toUserData.id ?? '',
          'to_name': toUserData.name ?? '',
          'to_avatar': toUserData.photourl ?? ''
        });
      }
    }
  }

  asyncLoadAllData() async {
    var userbase = await db
        .collection('users')
        .where('id', isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options) => userdata.toFirestore())
        .get();
    for (var doc in userbase.docs) {
      state.contactList.add(doc.data());
    }
  }
}
