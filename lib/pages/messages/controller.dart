import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/store/store.dart';
import 'package:firebase_chat/pages/messages/state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagesController extends GetxController {
  MessagesController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessagesState state = MessagesState();
  var listener;
  RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );
  @override
  void onReady() {
    super.onReady();
    getFCMToken();
  }

  void onRefresh() {
    asyncLoadAllData().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    asyncLoadAllData().then((_) {
      refreshController.loadComplete();
    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  asyncLoadAllData() async {
    var fromMessages = await db
        .collection('message')
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where('from_uid', isEqualTo: token)
        .get();

    var toMessages = await db
        .collection('message')
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where('to_uid', isEqualTo: token)
        .get();
    state.msgList.clear();
    if (fromMessages.docs.isNotEmpty) {
      state.msgList.assignAll(fromMessages.docs);
    }
    if (toMessages.docs.isNotEmpty) {
      state.msgList.assignAll(toMessages.docs);
    }
  }

  getFCMToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      var user =
          await db.collection('users').where('id', isEqualTo: token).get();
      if (user.docs.isNotEmpty) {
        var docid = user.docs.first.id;
        await db.collection('users').doc(docid).update({'fcmtoken': fcmToken});
      }
    }
  }
}
