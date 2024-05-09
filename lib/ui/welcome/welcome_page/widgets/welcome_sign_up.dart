import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/ui/welcome/welcome_page/widgets/welcome_navigator_button.dart';

import '../../../../../_core/constants/move.dart';

class WelcomeSignUp extends StatelessWidget {
  const WelcomeSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 회원가입
      child: WelcomeNavigatorButton(
        buttonText: 'Sign up',
        routeName: Move.joinPage,
        // onTap: const JoinPage(),
        color: kAccentColor2,
        textColor: Colors.white,
      ),
    );
  }
}
