import 'package:flutter/material.dart';

import '../viewmodel/change_weight_viewmodel.dart';
import 'metric_view.dart';

class MuscleMassTab extends StatelessWidget {
  ChangeWeightModel model ;
  final String type;

  MuscleMassTab(this.model,this.type);

  @override
  Widget build(BuildContext context) {
    return buildMetricView(
      '현재 근육량',
      '${model.changeBodyData?.muscle} kg',
      '목표 근육량',
      '${model.changeBodyData?.goalMuscle} kg',
      Colors.greenAccent,
      [Color(0xFF11998E), Color(0xffF7F8F8)],
      model,
      type
    );
  }
}
