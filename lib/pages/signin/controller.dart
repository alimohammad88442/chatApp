import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/routes/routes.dart';
import 'package:firebase_chat/common/store/user.dart';
import 'package:firebase_chat/common/widgets/toast.dart';
import 'package:firebase_chat/pages/signin/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SinginController extends GetxController {
  final state = SinginState();
  SinginController();
  final db = FirebaseFirestore.instance;
  Future handleSignin() async {
    try {
      var user = await googleSignIn.signIn();
      if (user != null) {
        final gauthentication = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: gauthentication.idToken,
          accessToken: gauthentication.accessToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photo = user.photoUrl ?? '';
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photo;
        userProfile.accessToken = id;
        UserStore.to.saveProfile(userProfile);
        var userbase = await db
            .collection('users')
            .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore())
            .where('id', isEqualTo: id)
            .get();
        if (userbase.docs.isEmpty) {
          final data = UserData(
            id: id,
            name: displayName,
            email: email,
            photourl: photo,
            location: '',
            fcmtoken: '',
            addtime: Timestamp.now(),
          );
          await db
              .collection('users')
              .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userdata, options) =>
                      userdata.toFirestore())
              .add(data);
        }
        toastInfo(msg: 'login success');
        Get.offAndToNamed(AppRoutes.Application);
      }
    } catch (e) {
      toastInfo(msg: 'login erroe');
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {}
    });
  }
}
