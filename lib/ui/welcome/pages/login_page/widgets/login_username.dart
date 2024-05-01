import 'package:flutter/material.dart';

class LoginUsername extends StatelessWidget {
  const LoginUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: const Text('ID'),
        hintText: 'ID를 입력하세요',
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
