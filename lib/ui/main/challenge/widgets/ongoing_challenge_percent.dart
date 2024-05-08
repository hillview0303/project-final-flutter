import 'package:flutter/material.dart';

class OngoingChallengePercent extends StatelessWidget {
  final int currentSteps;
  final int totalSteps;

  const OngoingChallengePercent({
    Key? key,
    required this.currentSteps,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = (currentSteps / totalSteps) * 100;
    String progressText = "${progress.toStringAsFixed(1)}%";

    return Row(
      children: [
        Expanded(
          child: Text("$progressText/100%",
              style: const TextStyle(fontSize: 15)),
        ),
        Expanded(
          child: Text("현재 $currentSteps걸음/총 $totalSteps걸음",
              style: const TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}