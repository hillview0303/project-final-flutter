import 'package:flutter/material.dart';
import 'package:project_app/pages/activity/layout/activity_body.dart';

import 'layout/activity_header.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ActivityHeader(),
        SizedBox(
          height: 500,
          child: ActivityBody(),
        ),
      ],
    );
  }
}