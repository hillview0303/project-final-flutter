import 'package:flutter/material.dart';
import 'package:project_app/ui/main/activity/viewmodel/change_weight_viewmodel.dart';

import 'metric_view.dart';

class WeightTab extends StatelessWidget {
  ChangeWeightModel model ;

  WeightTab(this.model);

  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재 체중',
      '${model.changeBodyData?.weight} kg',
      '목표 체중',
      '${model.changeBodyData?.goalWeight} kg',
      Colors.redAccent,
      [Color(0xFFFF512F), Color(0xffF7F8F8)],
    );
  }
}
