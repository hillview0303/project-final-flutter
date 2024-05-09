import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../_core/constants/constants.dart';

class OngoingChallengeProgressBar extends StatelessWidget {
  final double progress;

  const OngoingChallengeProgressBar({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: 0,
      maximum: 100,
      showTicks: false,
      showLabels: false,
      axisTrackStyle: LinearAxisTrackStyle(
        thickness: 25,
        edgeStyle: LinearEdgeStyle.bothCurve,
        color: Colors.grey[300],
      ),
      barPointers: [
        LinearBarPointer(
          value: progress,
          thickness: 25,
          edgeStyle: LinearEdgeStyle.bothCurve,
          color: kAccentColor2,
          animationDuration: 1000,
        ),
      ],
    );
  }
}
