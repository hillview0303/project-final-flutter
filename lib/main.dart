import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/welcome_page.dart';
import 'package:project_app/common/design/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const WelcomePage(),
    );
  }
}