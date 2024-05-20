import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/size.dart';
import '../../../../../data/models/activities/activity.dart';
import '../../../../data/dtos/activity/activity_response.dart';
import '../../today/viewmodel/step_timer_viewmodel.dart';
import '../pages/change_weight_detail_page.dart';
import '../pages/diet_management_detail_page.dart';
import '../pages/drink_water_detail_page.dart';
import '../pages/step_count_detail_page.dart';
import '../viewmodel/activity_main_viewmodel.dart';
import 'metric_card.dart';

class MetricGrid extends ConsumerWidget {
  final ActivityMainModel? model;

  MetricGrid({this.model});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (1 / 1.5),
      crossAxisSpacing: 7,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(gap_s),
      children: buildActivityCards(context,ref),
    );
  }

  List<Widget> buildActivityCards(BuildContext context,WidgetRef ref) {
    final stepTimerState = ref.watch(StepTimerProvider);
    final int currentSteps = stepTimerState.currentSteps;

    List<Widget> cards = [];

    if (model != null && model!.activitiesDateDTO != null) {
      var data = model!.activitiesDateDTO;
      // 걸음
      if (data.walking != 0) {
        cards.add(buildCard(
          context: context,
          title: 'STEPS',
          subtitle: '${currentSteps} steps',
          trailing: formatTimeAgo(model),
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildCard(
          context: context,
          title: 'STEPS',
          subtitle: '${data.walking} steps',
          trailing: "기록이 없습니다",
          activity: data,
          hasData: true,
        ));
      }
      // 물 마시기
      if (data.drinkWater != 0) {
        cards.add(buildCard(
          context: context,
          title: 'WATER',
          subtitle: '${(data.drinkWater! ~/ 250)} cups',
          trailing: formatTimeAgo(model),
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildCard(
          context: context,
          title: 'WATER',
          subtitle: '${(data.drinkWater! ~/ 250)} cups',
          trailing: "기록이 없습니다",
          activity: data,
          hasData: true,
        ));
      }
      // 칼로리
      if (data.kcal != 0) {
        cards.add(buildCard(
          context: context,
          title: 'CALORIES',
          subtitle: '${data.kcal} kcal',
          trailing: formatTimeAgo(model),
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildCard(
          context: context,
          title: 'CALORIES',
          subtitle: '${data.kcal} kcal',
          trailing: "기록이 없습니다",
          activity: data,
          hasData: true,
        ));
      }
      // 체중
      if (data.weight != 0) {
        cards.add(buildCard(
          context: context,
          title: 'BODYDATA',
          subtitle: '${data.weight} kg',
          trailing: formatTimeAgo(model),
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildCard(
          context: context,
          title: 'BODYDATA',
          subtitle: '${data.weight} kg',
          trailing: "기록이 없습니다",
          activity: data,
          hasData: true,
        ));
      }
    }

    return cards;
  }

  Widget buildEmptyCard(
      {required BuildContext context, required String title}) {
    return MetricCard(
      title: title,
      subtitle: 'No data',
      trailing: '',
      percentage: 0,
      // 데이터가 없으므로 진행률 0으로 설정
      onTap: () => navigateToDetailPageForMissingData(context, title),
      hasData: false, // 데이터가 없음을 나타냄
    );
  }

  Widget buildCard(
      {required BuildContext context,
      required String title,
      required String subtitle,
      required String trailing,
      required ActivitiesDateDTO activity,
      required bool hasData}) {
    return MetricCard(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      // 올바르게 전달된 trailing 사용
      percentage: 40,
      // 예시로 40%를 넣었지만, 실제로는 활동에 따라 다른 비율을 계산하여 설정해야 합니다.
      onTap: () => navigateToDetailPageForMissingData(context, title),
      hasData: hasData,
    );
  }

  void navigateToDetailPageForMissingData(BuildContext context, String title) {
    switch (title) {
      case 'STEPS':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StepCountDetailPage()));
        break;
      case 'WATER':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()));
        break;
      case 'CALORIES':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DietManagementDetailPage()));
        break;
      case 'BODYDATA':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangeWeightDetailPage()));
        break;
    }
  }

  String formatTimeAgo(ActivityMainModel? model) {
    final DateTime now = DateTime.now();
    final Duration difference =
        now.difference(model!.activitiesDateDTO.createdAt);


    if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }


  }
}
