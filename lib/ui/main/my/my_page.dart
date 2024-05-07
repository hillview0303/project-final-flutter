import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/line.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/viewmodel/my_page_view_model.dart';
import 'package:project_app/ui/main/my/widgets/company_info.dart';
import 'package:project_app/ui/main/my/widgets/contact_icons.dart';
import 'package:project_app/ui/main/my/widgets/logout_button.dart';
import 'package:project_app/ui/main/my/widgets/my_history.dart';
import 'package:project_app/ui/main/my/widgets/my_profile.dart';
import 'package:project_app/ui/main/my/widgets/my_status.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyPageModel? myPageModel = ref.watch(myPageProvider);
    if(myPageModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: [
          MyProfile(myPageModel.myPageDTO),
          MyStatus(myPageModel.myPageDTO),
          line2,
          MyHistory(myPageModel.myPageDTO),
          SizedBox(height: gap_l),
          line2,
          CompanyInfo(),
          ContactIcons(),
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
}