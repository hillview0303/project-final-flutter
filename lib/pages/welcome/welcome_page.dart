import 'package:flutter/material.dart';
import 'components/custom_scaffold.dart';
import 'layout/welcom_logo.dart';
import 'layout/welcome_sign_in.dart';
import 'layout/welcome_sign_up.dart';
import 'layout/welcome_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Logo(),
          WelcomeText(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  SignIn(), // 로그인
                  SignUp(), //회원가입
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
