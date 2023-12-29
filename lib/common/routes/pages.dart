import 'package:firebase_chat/common/middlewares/router_welcome.dart';
import 'package:firebase_chat/pages/application/index.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:firebase_chat/pages/signin/index.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/messages/chat/index.dart';
import 'package:firebase_chat/pages/messages/photoview/index.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static const appLication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [RouteWelcomeMiddleware(priority: 1)]
    ),
     GetPage(
      name: AppRoutes.signIn,
      page: () => const SinginPage(),
      binding: SinginBinding(),
    ),

    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    //  middlewares: [
      //  RouteAuthMiddleware(priority: 1),
     // ],
    ),

  
    GetPage(name: AppRoutes.Contact, page: () => const ContactPage(), binding: ContactBinding()),
   
    //GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding()),
    
    GetPage(name: AppRoutes.Me, page: () => const ProfilePage(), binding: ProfileBinfings()),
   
    GetPage(name: AppRoutes.Chat, page: () => const ChatPage(), binding: ChatBinding()),

    GetPage(name: AppRoutes.Photoimgview, page: () => const PhotoImageView(), binding: PhotoImageViewBindins()),
  ];
}
