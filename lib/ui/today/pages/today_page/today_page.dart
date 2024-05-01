import 'package:flutter/material.dart';
import 'package:project_app/ui/today/pages/today_page/widgets/today_header.dart';

import 'widgets/today_body.dart';

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
