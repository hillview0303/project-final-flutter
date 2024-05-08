import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

import '../widgets/ongoing_challenge_img.dart';
import '../widgets/ongoing_challenge_percent.dart';

class OngoingChallengeDetailPage extends StatelessWidget {
  final AttendChallenge? challenge;

  const OngoingChallengeDetailPage({Key? key, required this.challenge})
      : super(key: key);

  double _calculateProgress(int currentSteps, int totalSteps) {
    return currentSteps / totalSteps;
  }

  @override
  Widget build(BuildContext context) {
    int currentSteps = 10000; // 임의의 값으로 테스트
    int totalSteps = 10000;
    // int currentSteps = challenge!.currentSteps!; 수정 필요
    // int totalSteps = challenge!.totalSteps!;
    double progress = _calculateProgress(currentSteps, totalSteps);

    return Scaffold(
      appBar: AppBar(
        title: Text(challenge!.challengeName!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OngoingChallengeImg(progress: progress), // 진행 상황에 따른 이미지 표시
              const SizedBox(height: 20),
              Text("${challenge!.subtitle}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: progress, // 진행 상황을 백분율로 표현
                backgroundColor: Colors.grey[300],
                color: Theme.of(context).primaryColor,
              ),
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