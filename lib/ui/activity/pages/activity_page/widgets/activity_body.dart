import 'package:flutter/material.dart';
import 'activity_body_title.dart';
import 'metric_grid.dart';

class ActivityBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // 높이 최소화
      children: [
        ActivityBodyTitle(),
        Expanded(
          child: MetricGrid(),
        ),
      ],
    );
  }
}