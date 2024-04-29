import 'package:flutter/material.dart';
import '../../change_weight_detail_page/change_weight_detail_page.dart';
import '../../diet_management_detail_page/diet_management_detail_page.dart';
import '../../drink_water_detail_page/drink_water_detail_page.dart';
import '../../step_count_detail_page/step_count_detail_page.dart';
import 'metric_card.dart';

class MetricGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (1 / 1.5), // 카드 비율 조정
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      padding: EdgeInsets.all(16),
      children: <Widget>[
        MetricCard(
          title: 'STEPS',
          subtitle: '7500',
          trailing: '최근 업데이트 3분전',
          color: Colors.white,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StepCountDetailPage()),
          ),
        ),
        MetricCard(
          title: 'WATER',
          subtitle: '8 cups',
          trailing: '최근 업데이트 3분전',
          color: Colors.white,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()),
          ),
        ),
        MetricCard(
          title: 'CALORIES',
          subtitle: '500 cal',
          trailing: '최근 업데이트 3분전',
          color: Colors.white,
          percentage: 40.0, // '식단 관리'에만 원형 차트 백분율을 넣습니다.
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DietManagementDetailPage()),
          ),
        ),
        MetricCard(
          title: 'WEIGHT',
          subtitle: '58 kg',
          trailing: '최근 업데이트 3분전',
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