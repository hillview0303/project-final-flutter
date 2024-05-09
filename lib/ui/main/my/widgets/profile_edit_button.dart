import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../pages/profile_edit_page.dart';

class ProfileEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(gap_s),
      onTap: () {
        // 프로필 수정 기능 구현
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileEditPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(gap_s),
        ),
        child: Icon(FontAwesomeIcons.penToSquare)),
    );
  }
}