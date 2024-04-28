import 'package:flutter/material.dart';

import '../../../common/components/cardbox.dart';
import '../pages/diet_management_detail_page.dart';
class DietManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DietManagementDetailPage()),
        );
      },
      child: CardBox(
        title: '식단 관리',
        subtitle: '개인 맞춤 식단 확인',
      ),
    );
  }
}