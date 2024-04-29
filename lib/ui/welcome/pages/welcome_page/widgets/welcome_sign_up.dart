import 'package:flutter/material.dart';
import 'package:project_app/ui/welcome/pages/welcome_page/widgets/welcome_button.dart';

import '../../../../../_core/constants/move.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // 회원가입
      child: WelcomeButton(
        buttonText: 'Sign up',
        routeName: Move.joinPage,
        // onTap: const JoinPage(),
        color: Colors.teal,
        textColor: Colors.white,
      ),
    );
  }
}
