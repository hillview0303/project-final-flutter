import 'package:flutter/material.dart';

class LoginRememberForgot extends StatelessWidget {
  const LoginRememberForgot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Checkbox(
              value: false,
              onChanged: null,
            ),
            const Text(
              '기억하기',
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
        const Text(
          '비밀번호 찾기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}
