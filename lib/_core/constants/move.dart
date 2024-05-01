import 'package:flutter/material.dart';

import '../../ui/main_page.dart';
import '../../ui/today/pages/today_page/today_page.dart';
import '../../ui/welcome/pages/join_page/join_page.dart';
import '../../ui/welcome/pages/login_page/login_page.dart';
import '../../ui/welcome/pages/welcome_page/welcome_page.dart';

class Move {
  static String welcomePage = "/welcome";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String mainPage = "/main";
  static String todayPage = "/today"; // 주소는 아직 미확정
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.welcomePage: (context) => const WelcomePage(),
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.mainPage: (context) => const MainPage(),
    Move.todayPage: (context) => const TodayPage(),
  };
}
