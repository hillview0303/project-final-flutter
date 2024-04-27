import 'package:flutter/material.dart';
import 'package:project_app/pages/my/components/profile_edit_button.dart';
import 'package:project_app/pages/my/components/profile_image.dart';

import '../../../common/design/size.dart';
import '../../../common/design/style.dart';

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
