import 'package:flutter/material.dart';

import 'metric_view.dart';

class FatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재 체지방',
      '20%',
      '목표 체지방',
      '15%',
      Colors.blueAccent,
      [Color(0xFF1E88E5), Color(0xffF7F8F8)],
    );
  }
}
