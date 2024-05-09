import 'package:flutter/material.dart';
import '../widgets/buffer_progress_widget.dart';

class StepCountProgress extends StatelessWidget {
  final int currentSteps;

  StepCountProgress({required this.currentSteps});

  @override
  Widget build(BuildContext context) {
    int goalSteps = 10000; // 예시 목표 걸음 수
    double progressPercentage = currentSteps / goalSteps * 100;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '목표의 ${progressPercentage.toStringAsFixed(1)}%를 달성했어요!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        BufferProgressWidget(goalSteps: goalSteps, currentSteps: currentSteps),
      ],
    );
  }
}
