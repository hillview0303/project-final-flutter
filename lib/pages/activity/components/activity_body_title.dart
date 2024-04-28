import 'package:flutter/material.dart';
import 'package:project_app/pages/activity/pages/add_activity_page.dart';

import '../../../common/design/size.dart';
import '../../../common/design/style.dart';
import '../../my/pages/my_changes.dart';

class ActivityBodyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_sm),
      child: Row(
        children: [
          Text("일일 통계", style: subtitle1()),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddActivityPage()),
              );
            },
            child: Text(
              "활동 추가하기",
              style: subtitle2(),
            ),
          ),
        ],
      ),
    );
  }
}