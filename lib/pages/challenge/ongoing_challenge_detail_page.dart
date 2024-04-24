import 'package:flutter/material.dart';
import '../../../models/challenge.dart';

class OngoingChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;

  const OngoingChallengeDetailPage({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.challengeName),
      ),
      body: SingleChildScrollView(  // Ensure the content is scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/challengedetail.png',
                height: 500.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text("${challenge.location}", style: TextStyle(fontSize: 20)),
              Text("${challenge.distance} m", style: TextStyle(fontSize: 20)),
              Text("${challenge.content}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: 0.5,  // Example progress value
                backgroundColor: Colors.grey[300],
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text("Steps: 1500", style: TextStyle(fontSize: 18)),  // Example step count
                  ),
                  Expanded(
                    child: Text("990 / ${challenge.distance * 0.5} km", style: TextStyle(fontSize: 18)),  // Example dynamic distance calculation
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
