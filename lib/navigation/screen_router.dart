import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/navigation/routes.dart';
import 'package:seojun_dataview_app/service/account.dart';

FirebaseAuth auth = getAuth();

class ScreenRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        var user = getUser();
        if (user == null) {
          return
        } else {

        }
      case Routes.signIn:
      case Routes.signOut:
      case Routes.home:
      case Routes.monitor:
      case Routes.project:
      case Routes.setting:
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('페이지를 찾을수 없습니다'),
                  ),
                ));
    }
  }
}
