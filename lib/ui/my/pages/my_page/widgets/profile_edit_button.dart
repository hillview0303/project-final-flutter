import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../profile_edit_page/profile_edit_page.dart';

class ProfileEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1),
      onTap: () {
        // 프로필 수정 기능 구현
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileEditPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 1, top: 1, left: gap_s, right: gap_s),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.all(Radius.circular(gap_s)),
        ),
        child: Text("프로필 수정", style: subtitle2()),
      ),
    );
  }
}
