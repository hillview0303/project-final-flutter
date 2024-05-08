import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../_core/constants/constants.dart';
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
    int currentSteps = 5000; // 임의의 값으로 테스트
    int totalSteps = 10000;
    // int currentSteps = challenge!.currentSteps!; 수정 필요
    // int totalSteps = challenge!.totalSteps!;
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
              OngoingChallengeImg(progress: progress / 100), // 진행률 0-1 범위로 변경
              const SizedBox(height: 20),
              Text("${challenge?.subtitle ?? 'No subtitle provided'}",
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              SfLinearGauge(
                minimum: 0,
                maximum: 100,
                showTicks: false,
                showLabels: false,
                axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 15,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  color: Colors.grey[300],
                ),
                barPointers: [
                  LinearBarPointer(
                    value: progress,
                    thickness: 15,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    color: kAccentColor2,
                    animationDuration: 1000,
                  )
                ],
                markerPointers: [
                  LinearShapePointer(
                    value: progress,
                    shapeType: LinearShapePointerType.circle,
                    color: kAccentColor2,
                    position: LinearElementPosition.cross,
                    offset: 5,
                  )
                ],
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