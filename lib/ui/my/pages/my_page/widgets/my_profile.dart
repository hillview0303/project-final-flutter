

import 'package:flutter/cupertino.dart';
import 'package:project_app/ui/my/pages/my_page/widgets/profile_edit_button.dart';
import 'package:project_app/ui/my/pages/my_page/widgets/profile_image.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: gap_s),
          ProfileImage(),
          Text(
            "류재성님",
            style: h6(),
          ),
          SizedBox(height: gap_s),
          ProfileEditButton(),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }
}
