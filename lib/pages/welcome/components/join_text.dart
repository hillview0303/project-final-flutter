import 'package:flutter/material.dart';

class JoinText extends StatelessWidget {
  const JoinText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('계정이 없으신가요? ',
            style: TextStyle(color: Colors.black45)),
        Text('회원가입하기',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal)),
      ],
    );
  }
}

