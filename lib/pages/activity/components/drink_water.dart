import 'package:flutter/material.dart';

import '../../../common/components/cardbox.dart';
import '../pages/drink_water_detail_page.dart';

class DrinkWater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DrinkWaterDetailPage()),
        );
      },
      child: CardBox(
        title: '물마시기',
        subtitle: '물마시기',
      ),
    );
  }
}