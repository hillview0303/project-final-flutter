import 'package:flutter/material.dart';
import 'package:project_app/pages/welcome/components/welcome_button.dart';

import '../pages/join_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // 회원가입
      child: WelcomeButton(
        buttonText: 'Sign up',
        onTap: const JoinPage(),
        color: Colors.teal,
        textColor: Colors.white,
      ),
    );
  }
}
