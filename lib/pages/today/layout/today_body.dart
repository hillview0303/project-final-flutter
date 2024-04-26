import 'package:flutter/material.dart';
import 'package:project_app/common/components/composition_box2.dart';
import 'package:project_app/common/design/style.dart';
import 'package:project_app/pages/my/pages/my_changes.dart';
import 'package:project_app/pages/today/components/changes_chart.dart';
import 'package:project_app/pages/today/components/mission_container_list.dart';

import '../../../common/design/size.dart';
import '../../../data/models/chartDummy.dart';

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
                ChangesChart(
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
        MissionContainerList(),
      ],
    );
  }
}
