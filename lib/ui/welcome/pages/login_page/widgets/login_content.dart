import 'package:flutter/material.dart';

import 'login_button.dart';
import 'login_line.dart';
import 'login_password.dart';
import 'login_remember_forgot.dart';
import 'login_sign_up.dart';
import 'login_title.dart';
import 'login_username.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginTitle(), // 로그인 타이틀
            const SizedBox(height: 40.0),
            LoginUsername(), // ID
            const SizedBox(height: 25.0),
            LoginPassword(), // 비밀번호
            const SizedBox(height: 25.0),
            LoginRememberForgot(), // 비밀번호찾기
            const SizedBox(height: 25.0),
            LoginButton(), // 로그인 버튼
            const SizedBox(height: 25.0),
            LoginLine(), // 또는
            const SizedBox(height: 25.0),
            LoginSignUp(), // 회원가입 페이지 가기
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
