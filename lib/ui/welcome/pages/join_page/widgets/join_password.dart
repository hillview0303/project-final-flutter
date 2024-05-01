import 'package:flutter/material.dart';

class JoinPassword extends StatelessWidget {
  const JoinPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: true, // 비밀번호를 숨겨서 보여줍니다
          decoration: InputDecoration(
            label: const Text('비밀번호'),
            hintText: '비밀번호를 입력하세요',
            hintStyle: const TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20), // 두 입력 필드 사이의 공간을 추가합니다
        TextFormField(
          obscureText: true, // 비밀번호를 숨겨서 보여줍니다
          decoration: InputDecoration(
            label: const Text('비밀번호 확인'),
            hintText: '비밀번호를 다시 입력하세요',
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