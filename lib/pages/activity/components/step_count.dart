import 'package:flutter/material.dart';

import '../../../common/components/cardbox.dart';
import '../pages/step_count_detail_page.dart';

class StepCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StepCountDetailPage()),
        );
      },
      child: CardBox(
        title: '걸음수',
        subtitle: '걸음수',
      ),
    );
  }
}