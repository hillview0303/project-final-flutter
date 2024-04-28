import 'package:flutter/material.dart';
import 'package:project_app/pages/activity/components/metric_grid.dart';
import '../components/activity_body_title.dart';

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