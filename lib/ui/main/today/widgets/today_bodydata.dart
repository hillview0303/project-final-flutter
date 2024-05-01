import 'package:flutter/material.dart';

import '../../../../_core/constants/size.dart';
import '../../../_common/components/composition_box2.dart';

class TodayBodydata extends StatelessWidget {
  const TodayBodydata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CompositionBox2(
            name: "체지방",
            titleColor: Colors.red,
            valueColor: Colors.red,
            borderColor: Colors.red,
            value: "14.2",
          ),
          SizedBox(
            width: gap_s,
          ),
          CompositionBox2(
            name: "골격근",
            titleColor: Colors.blue,
            valueColor: Colors.blue,
            borderColor: Colors.blue,
            value: "35.6",
          ),
          SizedBox(
            width: gap_s,
          ),
          CompositionBox2(
            name: "체중",
            titleColor: Colors.green,
            valueColor: Colors.green,
            borderColor: Colors.green,
            value: "76.7",
          ),
        ],
      ),
    );
  }
}
