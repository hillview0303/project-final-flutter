import 'package:flutter/material.dart';

import '../viewmodel/change_weight_viewmodel.dart';
import 'metric_view.dart';

class FatTab extends StatelessWidget {
  ChangeWeightModel model ;

  FatTab(this.model);
  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재 체지방',
      '${model.changeBodyData?.fat} kg',
      '목표 체지방',
      '${model.changeBodyData?.goalWeight} kg',
      Colors.blueAccent,
      [Color(0xFF1E88E5), Color(0xffF7F8F8)],
    );
  }
}
