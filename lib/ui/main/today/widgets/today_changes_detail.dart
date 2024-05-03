import 'package:flutter/material.dart';

import '../../../../_core/constants/style.dart';
import '../pages/my_changes_page.dart';

class TodayChangesDetail extends StatelessWidget {
  const TodayChangesDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("나의 변화", style: subtitle1()),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyChangesPage()),
            );
          },
          child: Text(
            "직접 입력",
            style: subtitle2(),
          ),
        ),
      ],
    );
  }
}
