import 'package:flutter/material.dart';

class ChallengeContent extends StatelessWidget {
  final String name;
  final String subtitle;
  final String content;

  const ChallengeContent({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
