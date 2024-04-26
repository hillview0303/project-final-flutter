import 'package:flutter/material.dart';

class JoinButtonSection extends StatelessWidget {
  const JoinButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        child: const Text('회원가입하기'),
      ),
    );
  }
}
