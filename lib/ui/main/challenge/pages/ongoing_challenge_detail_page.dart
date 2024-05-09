import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import '../widgets/ongoing_challenge_img.dart';
import '../widgets/ongoing_challenge_percent.dart';
import '../widgets/ongoing_challenge_progress_bar.dart';

class OngoingChallengeDetailPage extends StatelessWidget {
  final AttendChallenge? challenge;

  const OngoingChallengeDetailPage({Key? key, required this.challenge})
      : super(key: key);

  double _calculateProgress(int currentSteps, int totalSteps) {
    return currentSteps / totalSteps;
  }

  @override
  Widget build(BuildContext context) {
    int currentSteps = 3000; // 테스트용 값
    int totalSteps = 10000;
    double progress = _calculateProgress(currentSteps, totalSteps) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text(challenge?.challengeName ?? "Challenge"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OngoingChallengeImg(progress: progress / 100),
              const SizedBox(height: 20),
              Text("${challenge?.challengeName}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kAccentColor2)),
              SizedBox(height: 10),
              Text("${challenge?.subtitle ?? 'No subtitle provided'}",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              OngoingChallengeProgressBar(progress: progress),
              const SizedBox(height: 20),
              OngoingChallengePercent(
                currentSteps: currentSteps,
                totalSteps: totalSteps,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
