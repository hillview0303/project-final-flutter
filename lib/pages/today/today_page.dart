import 'package:flutter/material.dart';
import 'package:project_app/pages/today/today_header.dart';

import 'today_body.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text("TodayPage"));
    return ListView(
      children: [
        TodayHeader(),
        TodayBody(),
      ],
    );
  }
}
