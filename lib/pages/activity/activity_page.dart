import 'package:flutter/material.dart';
import 'package:project_app/pages/activity/layout/activity_body.dart';

import 'components/diet_management.dart';
import 'components/drink_water.dart';
import 'components/step_count.dart';
import 'layout/activity_header.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ActivityHeader(),
        ActivityBody(),
      ],
    );
  }
}