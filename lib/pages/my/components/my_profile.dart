import 'package:flutter/material.dart';
import 'package:project_app/common/design/size.dart';

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
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/images/saram1.png"))),
          ),
          Text(
            "류재성님",
            style: h6(),
          ),
          SizedBox(height: gap_s),
          InkWell(
            borderRadius: BorderRadius.circular(1),
            child: Container(
              padding:
                  EdgeInsets.only(bottom: 1, top: 1, left: gap_s, right: gap_s),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.all(Radius.circular(gap_s)),
              ),
              child: Text("프로필 수정", style: subtitle2()),
            ),
          ),
          SizedBox(height: gap_s),
        ],
      ),
    );
  }
}
