import 'package:flutter/material.dart';

import 'metric_view.dart';

class MuscleMassTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재 근육량',
      '40 kg',
      '목표 근육량',
      '45 kg',
      Colors.greenAccent,
      [Color(0xFF11998E), Color(0xffF7F8F8)],
    );
  }
}
