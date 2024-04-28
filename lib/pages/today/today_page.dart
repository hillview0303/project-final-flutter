import 'package:flutter/material.dart';
import 'package:project_app/pages/today/layout/today_header.dart';

import 'layout/today_body.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TodayHeader(),
          TodayBody(),
        ],
      ),
    );
  }
}
