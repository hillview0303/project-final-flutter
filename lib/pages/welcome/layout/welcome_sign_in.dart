import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/components/welcome_button.dart';

import '../pages/login_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // 로그인
      child: WelcomeButton(
        buttonText: 'Sign in',
        onTap: LoginPage(),
        color: Colors.teal,
        textColor: Colors.white,
      ),
    );
  }
}
