import 'package:flutter/material.dart';

class JoinCheckbox extends StatelessWidget {
  const JoinCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Checkbox(value: true, onChanged: null),
        const Text(
          '개인정보 처리 방침',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal),
        ),
        Text(
          '에 동의합니다',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
