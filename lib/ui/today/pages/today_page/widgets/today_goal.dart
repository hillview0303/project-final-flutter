import 'package:flutter/material.dart';

import '../../../../../_core/constants/style.dart';
import 'today_goal_insert.dart';

class GoalSection extends StatelessWidget {
  const GoalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("목표 설정"),
              content: SingleChildScrollView(
                child: Container(
                  height: 130,
                  // color: Colors.white,
                  child: Center(
                    child: GoalInsertSection(),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Text(
        "목표 설정 >",
        style: subtitle2(mColor: Colors.grey[400]!),
      ),
    );
  }
}
