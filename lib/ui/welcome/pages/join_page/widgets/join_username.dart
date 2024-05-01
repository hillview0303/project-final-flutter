import 'package:flutter/material.dart';

class JoinUsername extends StatelessWidget {
  const JoinUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              label: const Text('ID'),
              hintText: 'ID를 입력하세요',
              hintStyle:
              const TextStyle(color: Colors.black26),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // 중복 버튼
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding:
              const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('중복 확인'),
          ),
        ),
      ],
    );
  }
}
