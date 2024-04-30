import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // 로고
      flex: 6,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,  // 이미지를 비율에 맞춰 조절
        ),
      ),
    );
  }
}
