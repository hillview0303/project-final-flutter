import 'package:flutter/material.dart';
import '../../../models/challenge.dart';

class ChallengeContainer extends StatelessWidget {
  final Challenge challenge;

  const ChallengeContainer({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 150,
      color: Colors.white.withOpacity(0.3),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset('assets/1.png', width: 50, height: 50, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10),
          Text(challenge.challengeName, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
