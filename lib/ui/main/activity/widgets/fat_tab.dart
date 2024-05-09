import 'package:flutter/material.dart';

import '../viewmodel/change_weight_viewmodel.dart';
import 'metric_view.dart';

class FatTab extends StatelessWidget {
  ChangeWeightModel model ;
  final String type;

  FatTab(this.model,this.type);
  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재 체지방',
      '${model.changeBodyData?.fat} kg',
      '목표 체지방',
      '${model.changeBodyData?.goalFat} kg',
      Colors.blueAccent,
      [Color(0xFF1E88E5), Color(0xffF7F8F8)],
      model,
      type,
    );
  }
}
