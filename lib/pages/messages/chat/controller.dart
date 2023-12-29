import 'dart:io';
import 'package:firebase_chat/common/utils/security.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/store/user.dart';
import 'package:flutter/widgets.dart';
import 'index.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ChatController extends GetxController {
  ChatState state = ChatState();
  ChatController();
  var docId;
  final textControler = TextEditingController();
  ScrollController messagescrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final userId = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;
  File? photo;
  final ImagePicker picker = ImagePicker();
  Future imgFromGalley() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      upladFile();
    } else {
      print('no images');
    }
  }

  Future getImgUrl(String name) async {
    final spaceraf = FirebaseStorage.instance.ref('chat').child(name);
    var str = await spaceraf.getDownloadURL();
    return str;
  }

  sendImageMessage(String url) async {
    final contant = Msgcontent(
      uid: userId,
      content: url,
      type: 'image',
      addtime: Timestamp.now(),
    );

    await db
        .collection('message')
        .doc('doce_id')
        .collection('messagesList')
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgContent, options) {
              return msgContent.toFirestore();
            })
        .add(contant)
        .then((DocumentReference doc) {
      print('Document snapshot added whith id${doc.id}');
      textControler.clear();
      Get.focusScope?.unfocus();
    });
    await db.collection('message').doc('doce_id').update({
      'last_msg': '[image]',
      'last_time': Timestamp.now(),
    });
  }

  Future upladFile() async {
    if (photo == null) return;
    final fileName = getRandomString(15) + extension(photo!.path);
    try {
      final ref = FirebaseStorage.instance.ref('chat').child(fileName);
      await ref.putFile(photo!).snapshotEvents.listen((event) async {
        switch (event.state) {
          case TaskState.running:
            break;
          case TaskState.paused:
            break;
          case TaskState.success:
            String imgurl = await getImgUrl(fileName);
            sendImageMessage(imgurl);

            break;
          default:
        }
      });
    } catch (e) {}
  }

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    docId = data['doce_id'];
    state.toUid.value = data['to_uid'] ?? '';
    state.toName.value = data['to_name'] ?? '';
    state.toAvatar.value = data['to_avatar'] ?? '';
  }

  sendMessage() async {
    String sendContent = textControler.text;
    final contant = Msgcontent(
      uid: userId,
      content: sendContent,
      type: 'text',
      addtime: Timestamp.now(),
    );
    await db
        .collection('message')
        .doc('doce_id')
        .collection('messagesList')
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgContent, options) {
              return msgContent.toFirestore();
            })
        .add(contant)
        .then((DocumentReference doc) {
      print('Document snapshot added whith id${doc.id}');
      textControler.clear();
      Get.focusScope?.unfocus();
    });
    await db.collection('message').doc('doce_id').update({
      'last_msg': sendContent,
      'last_time': Timestamp.now(),
    });
  }

  @override
  void onReady() {
    super.onReady();
    var messages = db
        .collection('message')
        .doc(docId)
        .collection('messagesList')
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) {
              return msgcontent.toFirestore();
            })
        .orderBy('addtime', descending: false);
    state.msgContentList.clear();
    listener = messages.snapshots().listen((event) {
      for (var element in event.docChanges) {
        switch (element.type) {
          case DocumentChangeType.added:
            if (element.doc.data() != null) {
              state.msgContentList.insert(0, element.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    }, onError: (error) => print('Listen failde ${error}'));
  }

  @override
  void dispose() {
    super.dispose();
    messagescrolling.dispose();
    listener.cancle();
  }
}
