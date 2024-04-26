import 'package:flutter/material.dart';

class LoginInputFields extends StatelessWidget {
  const LoginInputFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: const Text('ID'),
            hintText: 'ID를 입력하세요',
            hintStyle: const TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 25.0),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            label: const Text('Password'),
            hintText: '비밀번호를 입력하세요',
            hintStyle: const TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
