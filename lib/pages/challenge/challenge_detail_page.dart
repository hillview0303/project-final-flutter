import 'package:flutter/material.dart';
import '../../../models/challenge.dart';

class ChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;

  // 생성자에 challenge 추가
  const ChallengeDetailPage({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.challengeName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Location: ${challenge.location}", style: TextStyle(fontSize: 20)),
            Text("Distance: ${challenge.distance} km", style: TextStyle(fontSize: 20)),
            Text("Description: ${challenge.content}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}