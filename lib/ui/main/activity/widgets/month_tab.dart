import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_app/ui/main/activity/viewmodel/walking_detail.viewmodel.dart';

import '../../../../_core/constants/constants.dart';

class MonthTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WalkingDetailModel? model = ref.read(WalkingDetailProvider);

    String formattedDate = model?.walkingDetailDTO.maxWalkingDay != null
        ? DateFormat('yyyy-MM-dd').format(model!.walkingDetailDTO.maxWalkingDay!)
        : "데이터가 없습니다.";

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text("한달 총 걸음수: ${model?.walkingDetailDTO.totalMonthWalking ?? 0} 걸음"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("한달 평균 걸음수: ${model?.walkingDetailDTO.avgMonthWalking ?? 0} 걸음"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("한달 평균 달성률: ${model?.walkingDetailDTO.avgMonthWalking ?? 0}%"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("가장 많이 걸은 날: $formattedDate (${model?.walkingDetailDTO.maxWalking ?? 0} 걸음)"),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}
