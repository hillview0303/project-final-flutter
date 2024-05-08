import 'package:flutter/material.dart';

class ChallengeImage extends StatelessWidget {
  final String imagePath;

  const ChallengeImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      ),
    );
  }
}
