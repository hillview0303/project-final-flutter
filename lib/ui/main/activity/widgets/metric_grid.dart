import 'package:flutter/material.dart';
import '../../../../../data/models/activities/activity.dart';
import '../../../../data/dtos/activity/activity_response.dart';
import '../pages/change_weight_detail_page.dart';
import '../pages/diet_management_detail_page.dart';
import '../pages/drink_water_detail_page.dart';
import '../pages/step_count_detail_page.dart';
import '../viewmodel/activity_main_viewmodel.dart';
import 'metric_card.dart';

class MetricGrid extends StatelessWidget {
  ActivityMainModel? model;

  MetricGrid({this.model});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (1 / 1.5),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: buildActivityCards(context),
    );
  }

  List<Widget> buildActivityCards(BuildContext context) {
    List<Widget> cards = [];

    if (model != null && model!.activitiesDateDTO != null) {
      var data = model!.activitiesDateDTO;
      // 걸음
      if (data.walking != null) {
        cards.add(buildCard(
          context: context,
          title: 'STEPS',
          subtitle: '${data.walking} steps',
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildEmptyCard(
          context: context,
          title: 'STEPS',
        ));
      }
      // 물 마시기
      if (data.drinkWater != null) {
        cards.add(buildCard(
          context: context,
          title: 'WATER',
          subtitle: '${(data.drinkWater! ~/ 250)} cups',
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildEmptyCard(
          context: context,
          title: 'WATER',
        ));
      }
      // 칼로리
      if (data.kcal != null) {
        cards.add(buildCard(
          context: context,
          title: 'CALORIES',
          subtitle: '${data.kcal} kcal',
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildCard(
            context: context,
            title: 'CALORIES',
            subtitle: '0 kcal',
            activity: data,
            hasData: true,
        ));
      }
      // 체중
      if (data.weight != null) {
        cards.add(buildCard(
          context: context,
          title: 'BODYDATA',
          subtitle: '${data.weight} kg',
          activity: data,
          hasData: true,
        ));
      } else {
        cards.add(buildEmptyCard(
          context: context,
          title: 'BODYDATA',
        ));
      }
    }

    return cards;
  }

  Widget buildEmptyCard({required BuildContext context, required String title}) {
    return MetricCard(
      title: title,
      subtitle: 'No data',
      trailing: '',
      percentage: 0, // 데이터가 없으므로 진행률 0으로 설정
      onTap: () => navigateToDetailPageForMissingData(context, title),
      hasData: false, // 데이터가 없음을 나타냄
    );
  }

  Widget buildCard({required BuildContext context, required String title, required String subtitle, required ActivitiesDateDTO activity, required bool hasData}) {
    return MetricCard(
      title: title,
      subtitle: subtitle,
      trailing: formatTimeAgo(activity.createdAt),
      percentage: 40, // 예시로 40%를 넣었지만, 실제로는 활동에 따라 다른 비율을 계산하여 설정해야 합니다.
      onTap: () => navigateToDetailPageForMissingData(context, title),
      hasData: true,
    );
  }

  // void navigateToDetailPage(BuildContext context, ActivitiesDateDTO activity) {
  //   // ActivitiesDateDTO 객체를 이용하여 상세 페이지로 네비게이션, 액티비티 타입에 따라 분기 처리
  //   if (activity.walking != null) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => StepCountDetailPage()));
  //   } else if (activity.drinkWater != null) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()));
  //   } else if (activity.kcal != null) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => DietManagementDetailPage()));
  //   } else if (activity.weight != null) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeWeightDetailPage()));
  //   }
  // }


  void navigateToDetailPageForMissingData(BuildContext context, String title) {
    switch (title) {
      case 'STEPS':
        Navigator.push(context, MaterialPageRoute(builder: (context) => StepCountDetailPage()));
        break;
      case 'WATER':
        Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()));
        break;
      case 'CALORIES':
        Navigator.push(context, MaterialPageRoute(builder: (context) => DietManagementDetailPage()));
        break;
      case 'BODYDATA':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeWeightDetailPage()));
        break;
    }
  }



  String formatTimeAgo(DateTime time) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(time);

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
