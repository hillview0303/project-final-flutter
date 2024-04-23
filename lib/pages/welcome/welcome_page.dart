import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/login_page.dart';
import 'package:project_app/pages/welcome/join_page.dart';

import 'components/custom_scaffold.dart';
import 'components/welcome_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded( // 로고
            flex: 6,
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,  // 이미지를 비율에 맞춰 조절
              ),
            ),
          ),
          Expanded( // 로고아래 글자
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome back!',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded( // 로그인
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: LoginPage(),
                      color: Colors.teal,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded( // 회원가입
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const JoinPage(),
                      color: Colors.teal,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
