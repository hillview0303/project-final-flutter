import 'package:flutter/material.dart';

import '../../../../../_core/constants/move.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.loginPage);
        },
        style: ElevatedButton.styleFrom(

          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        child: const Text('회원가입하기'),
      ),
    );
  }
}
