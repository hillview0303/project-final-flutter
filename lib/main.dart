import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/pages/welcome_page.dart';
import 'package:project_app/common/design/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // context가 없는 곳에서 context를 사용할 수 있는 방법
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const WelcomePage(),
    );
  }
}
