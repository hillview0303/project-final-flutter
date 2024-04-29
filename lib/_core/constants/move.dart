import 'package:flutter/material.dart';

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
