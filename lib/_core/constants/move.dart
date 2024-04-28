import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/pages/welcome_page.dart';

import '../../pages/main_page.dart';
import '../../pages/today/today_page.dart';
import '../../pages/welcome/pages/join_page.dart';
import '../../pages/welcome/pages/login_page.dart';

class Move {
  static String welcomePage = "/welcome";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String mainPage = "/main";
  static String todayPage = "/today"; // 주소는 아직 미확정
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.welcomePage :(context) => const WelcomePage(),
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.mainPage: (context) => const MainPage(),
    Move.todayPage:(context) => const TodayPage(),
  };
}
