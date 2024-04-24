import 'package:flutter/material.dart';

class StepCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This widget would display the step count for the day
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            '걸음 수 ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          // Add the step counter logic here
        ],
      ),
    );
  }
}