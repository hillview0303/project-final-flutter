import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/style.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../_common/components/composition_box2.dart';

class MyStatus extends StatelessWidget {
  const MyStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAccentColor1,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("현재 상태",
                  style: subtitle1(
                      mColor: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CompositionBox2(
                  name: "체지방",
                  titleColor: Colors.grey[500],
                  borderColor: Colors.white,
                ),
                SizedBox(width: gap_s),
                CompositionBox2(
                  name: "골격근",
                  titleColor: Colors.grey[500],
                  borderColor: Colors.white,
                ),
                SizedBox(width: gap_s),
                CompositionBox2(
                  name: "체중",
                  titleColor: Colors.grey[500],
                  borderColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
