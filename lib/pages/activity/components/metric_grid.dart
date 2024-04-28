import 'package:flutter/material.dart';
import 'package:project_app/pages/activity/pages/step_count_detail_page.dart';
import '../pages/change_weight_detail_page.dart';
import '../pages/diet_management_detail_page.dart';
import '../pages/drink_water_detail_page.dart';
import 'metric_card.dart';

class MetricGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: <Widget>[
        MetricCard(
          title: '걸음수',
          subtitle: '7500',
          trailing: '최근 업데이트 3m',
          color: Colors.white,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StepCountDetailPage()),
          ),
        ),
        MetricCard(
          title: '물 섭취',
          subtitle: '8 cups',
          trailing: '최근 업데이트 3m',
          color: Colors.white,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()),
          ),
        ),
        MetricCard(
          title: '식단 관리',
          subtitle: '500 cal',
          trailing: '40%',
          color: Colors.white,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DietManagementDetailPage()),
          ),
        ),
        MetricCard(
          title: '체중 변경',
          subtitle: '58 kg',
          trailing: '최근 업데이트 3m',
          color: Colors.white,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangeWeightDetailPage()),
          ),
        ),
      ],
    );
  }
}
