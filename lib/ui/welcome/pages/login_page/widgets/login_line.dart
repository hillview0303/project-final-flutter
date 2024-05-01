import 'package:flutter/material.dart';

class LoginLine extends StatelessWidget {
  const LoginLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.7,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('또는', style: TextStyle(color: Colors.black45)),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.7,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
