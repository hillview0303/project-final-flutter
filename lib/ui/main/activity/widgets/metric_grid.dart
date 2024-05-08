import 'package:flutter/material.dart';
import '../../../../../data/models/activities/activity.dart';
import '../pages/change_weight_detail_page.dart';
import '../pages/diet_management_detail_page.dart';
import '../pages/drink_water_detail_page.dart';
import '../pages/step_count_detail_page.dart';
import 'metric_card.dart';

class MetricGrid extends StatelessWidget {
  final List<Activity> activities;

  MetricGrid({required this.activities});

  @override
  Widget build(BuildContext context) {
    List<String> titles = ['STEPS', 'WATER', 'CALORIES', 'BODYDATA'];
    List<Widget> cards = buildActivityCards(context, titles);

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (1 / 1.5),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: cards,
    );
  }

  List<Widget> buildActivityCards(BuildContext context, List<String> titles) {
    List<Widget> cards = [];
    List<String> missingTitles = List.from(titles);

    cards = activities.map((activity) {
      String title = getTitleForActivity(activity);
      missingTitles.remove(title);

      return MetricCard(
        title: title,
        subtitle: getSubtitleForActivity(activity),
        trailing: formatTimeAgo(activity.createdAt),
        percentage: 40,
        onTap: () => navigateToDetailPage(context, activity),
        hasData: true,
      );
    }).toList();

    for (var title in missingTitles) {
      cards.add(MetricCard(
        title: title,
        subtitle: '데이터가 없습니다',
        trailing: '',
        onTap: () => navigateToDetailPageForMissingData(context, title),  // 변경된 부분
        hasData: false,
      ));
    }

    return cards;
  }

  String getTitleForActivity(Activity activity) {
    if (activity.walking != null) return 'STEPS';
    if (activity.drinkWater != null) return 'WATER';
    if (activity.kcal != null) return 'CALORIES';
    if (activity.weight != null) return 'BODYDATA';
    return 'DATA MISSING';
  }

  String getSubtitleForActivity(Activity activity) {
    if (activity.walking != null) return '${activity.walking} steps';
    if (activity.drinkWater != null) return '${activity.drinkWater} cups';
    if (activity.kcal != null) return '${activity.kcal} kcal';
    if (activity.weight != null) return '${activity.weight} kg';
    return '측정된 데이터가 없습니다';
  }

  void navigateToDetailPage(BuildContext context, Activity activity) {
    if (activity.walking != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StepCountDetailPage()));
    } else if (activity.drinkWater != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()));
    } else if (activity.kcal != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DietManagementDetailPage()));
    } else if (activity.weight != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeWeightDetailPage()));
    }
  }

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