import 'package:flutter/material.dart';
import 'package:project_app/common/components/composition_box.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/size.dart';
import 'package:project_app/style.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAccentColor1,
      width: double.infinity,
      height: 350,
      child: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "류재성님",
              style: h5(mColor: Colors.white),
            ),
            SizedBox(height: gap_s),
            Text(
              "오늘의 미션을 수행해보세요!",
              style: subtitle1(mColor: Colors.white),
            ),
            SizedBox(
              height: gap_m,
            ),
            Row(
              children: [
                Expanded(child: CompositionBox(name: "체지방", weight: 14.2)),
                SizedBox(width: gap_s),
                Expanded(child: CompositionBox(name: "골격근", weight: 35.6)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
