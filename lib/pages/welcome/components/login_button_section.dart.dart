import 'package:flutter/material.dart';

import '../../../_core/constants/move.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.mainPage);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        child: const Text('Log in'),
      ),
    );
  }
}
