import 'package:flutter/material.dart';
import 'package:project_app/pages/my/components/my_history.dart';
import 'package:project_app/pages/my/components/my_profile.dart';
import 'package:project_app/pages/my/components/my_status.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyProfile(),
        MyStatus(),
        MyHistory(),
      ],
    );
  }
}
