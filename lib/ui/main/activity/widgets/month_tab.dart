import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/viewmodel/walking_detail.viewmodel.dart';
import '../../../../_core/constants/constants.dart';
import '../../../../_core/utils/date_format.dart';

class MonthTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(WalkingDetailProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(kAccentColor2)));
    }

    String formattedDate = DateFormatter.format(model.walkingDetailDTO.maxWalkingDay);

    // weakWalkings 리스트에서 하루 10000걸음을 달성한날 계산
    int daysAchieved = model.weekWalkings
        .where((day) => day.walking >= 10000)
        .length;

    // 한 달 평균 달성률
    int totalDaysInMonth = DateTime.now().day; // 현재 날짜를 기준 한달 일수
    double achievementRate = (daysAchieved / totalDaysInMonth) * 100;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text("한달 총 걸음수: ${model.walkingDetailDTO.totalMonthWalking ?? 0} 걸음"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("한달 평균 걸음수: ${model.walkingDetailDTO.avgMonthWalking?.toStringAsFixed(0) ?? 0} 걸음"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("한달 평균 달성률: ${achievementRate.toStringAsFixed(1)}%"),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("가장 많이 걸은 날: $formattedDate (${model.walkingDetailDTO.maxWalking ?? 0} 걸음)"),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}
