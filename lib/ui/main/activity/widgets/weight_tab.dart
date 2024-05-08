import 'package:flutter/material.dart';

import 'metric_view.dart';

class WeightTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재체중',
      '58 kg',
      '목표체중',
      '64 kg',
      Colors.redAccent,
      [Color(0xFFFF512F), Color(0xffF7F8F8)],
    );
  }
}
