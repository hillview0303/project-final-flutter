import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/widgets/logout_button.dart';
import 'package:project_app/ui/main/my/widgets/my_history.dart';
import 'package:project_app/ui/main/my/widgets/my_profile.dart';
import 'package:project_app/ui/main/my/widgets/my_status.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyProfile(),
        MyStatus(),
        MyHistory(),
        SizedBox(height: gap_l),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoutButton(),
          ],
        ),

      ],
    );
  }
}
