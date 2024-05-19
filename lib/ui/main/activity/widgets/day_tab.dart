import 'package:flutter/material.dart';
import 'chart_background_widget.dart';

class DayTab extends StatelessWidget {
  final int currentSteps;

  DayTab({required this.currentSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        Expanded(
          child: ChartBackgroundWidget(
            milestones: [
              {'step': 5000, 'label': '5000걸음 돌파!'},
              {'step': 10000, 'label': '10000걸음 돌파!'},
              {'step': 20000, 'label': '20000걸음 달성!'}
            ],
            currentSteps: currentSteps,
          ),
        ),
      ],
    );
  }
}
