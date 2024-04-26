import 'package:flutter/material.dart';

import '../components/login_button.dart';
import '../components/login_divider_section.dart';
import '../components/login_input_fields.dart';
import '../components/login_remember_forgot_password_section.dart';
import '../components/login_sign_up_section.dart';
import '../components/login_title_section.dart';

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
            LoginTitleSection(),
            const SizedBox(height: 40.0),
            LoginInputFields(),
            const SizedBox(height: 25.0),
            LoginRememberForgotPasswordSection(),
            const SizedBox(height: 25.0),
            LoginButton(),
            const SizedBox(height: 25.0),
            LoginDividerSection(),
            const SizedBox(height: 25.0),
            LoginSignUpSection(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
