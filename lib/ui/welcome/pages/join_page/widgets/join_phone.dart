import 'package:flutter/material.dart';

class JoinPhone extends StatelessWidget {
  const JoinPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: const Text('휴대폰번호'),
        hintText: '휴대폰번호를 입력하세요',
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
