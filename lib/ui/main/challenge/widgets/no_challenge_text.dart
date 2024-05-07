import 'package:flutter/material.dart';

class NoChallengeText extends StatelessWidget {
  final text;

  NoChallengeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Center(
        child: Text(
          "${text}",
          style: TextStyle(fontSize: 24, color: Colors.grey[800]),
        ),
      ),
    );
  }
}
