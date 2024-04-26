import 'package:flutter/material.dart';

import '../../data/models/challenges/ongoing_challenge_detail.dart';
import 'components/ongoing_challenge_img.dart';
import 'components/ongoing_challenge_percent.dart';

class OngoingChallengeDetailPage extends StatelessWidget {
  final OngoingChallengeDetail challenge;

  const OngoingChallengeDetailPage({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.name),
      ),
      body: SingleChildScrollView(
        // Ensure the content is scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OngoingChallengeImg(),
              SizedBox(height: 20),
              Text("${challenge.subtitle}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: 0.5, // Example progress value
                backgroundColor: Colors.grey[300],
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 20),
              OngoingChallengePercent(),
            ],
          ),
        ),
      ),
    );
  }
}


