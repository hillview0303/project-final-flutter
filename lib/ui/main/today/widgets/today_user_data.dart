import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/today_status.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';

class TodayUserData extends StatelessWidget {
  const TodayUserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: kAccentColor1,
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/green.png'),
          fit: BoxFit.cover,  // 이미지를 컨테이너 크기에 맞추어 전체를 채웁니다.
        ),
        color: kAccentColor2,  // 이미지 로드 실패 시 대체 색상으로 사용
      ),
      child: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: gap_s),
            Text(
              "류재성님,",
              style: h5(mColor: Colors.blueGrey),
            ),
            const SizedBox(height: gap_s),
            Text(
              "반갑습니다!",
              style: subtitle1(mColor: Colors.blueGrey),
            ),
            SizedBox(height: gap_m),
            Row(
              children: [
                Expanded(child: TodayStatus(name: "체지방", weight: 14.2)),
                SizedBox(width: gap_s),
                Expanded(child: TodayStatus(name: "골격근", weight: 35.6)),
                SizedBox(width: gap_s),
                Expanded(child: TodayStatus(name: "체중", weight: 70.5)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
