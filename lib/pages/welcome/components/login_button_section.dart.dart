import 'package:flutter/material.dart';

import '../../main_page.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
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
