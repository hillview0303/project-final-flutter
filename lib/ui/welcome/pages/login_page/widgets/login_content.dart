import 'package:flutter/material.dart';

import 'login_button_section.dart.dart';
import 'login_divider_section.dart';
import 'login_password_section.dart';
import 'login_remember_forgot_password_section.dart';
import 'login_sign_up_section.dart';
import 'login_title_section.dart';
import 'login_username_section.dart';

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
            LoginTitleSection(), // 로그인 타이틀
            const SizedBox(height: 40.0),
            LoginUsernameSection(), // ID
            const SizedBox(height: 25.0),
            LoginPasswordSection(), // 비밀번호
            const SizedBox(height: 25.0),
            LoginRememberForgotPasswordSection(), // 비밀번호찾기
            const SizedBox(height: 25.0),
            LoginButtonSection(), // 로그인 버튼
            const SizedBox(height: 25.0),
            LoginDividerSection(), // 또는
            const SizedBox(height: 25.0),
            LoginSignUpSection(), // 회원가입 페이지 가기
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
