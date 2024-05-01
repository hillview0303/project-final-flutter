import 'package:flutter/material.dart';
import 'package:project_app/ui/today/pages/today_page/widgets/today_changes_chart.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../../data/models/chartDummy.dart';
import '../../../../_common/components/composition_box2.dart';
import '../../my_changes_page/my_changes.dart';
import 'today_mission_list.dart';

class TodayBody extends StatefulWidget {
  @override
  State<TodayBody> createState() => _TodayBodyState();
}

class _TodayBodyState extends State<TodayBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("나의 변화", style: subtitle1()),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyChanges()),
                        );
                      },
                      child: Text(
                        "자세히 보기",
                        style: subtitle2(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap_l),
                TodayChangesChart(
                  fatData: fatData,
                  muscleData: muscleData,
                  weightData: weightData,
                ),
                SizedBox(height: gap_l),
                Container(
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
                ),
              ],
            ),
          ),
        ),
        TodayMissionList(),
      ],
    );
  }
}
