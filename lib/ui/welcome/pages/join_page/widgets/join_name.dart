import 'package:flutter/material.dart';

class JoinName extends StatelessWidget {
  const JoinName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: const Text('별명'),
        hintText: '별명을 입력하세요',
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
