import 'package:flutter/material.dart';
import 'package:project_app/ui/welcome/pages/welcome_page/widgets/welcom_logo.dart';
import 'package:project_app/ui/welcome/pages/welcome_page/widgets/welcome_sign_in.dart';
import 'package:project_app/ui/welcome/pages/welcome_page/widgets/welcome_sign_up.dart';
import 'package:project_app/ui/welcome/pages/welcome_page/widgets/welcome_text.dart';

import '../../../_common/components/custom_scaffold.dart';


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
