import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../../data/models/challenges/challenge_detail.dart';
import '../../../../challenge/pages/challenge_page/widgets/completed_challenge.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: CompletedChallenge(
              title: "정복한 챌린지 보기",
              challenges: pastChallenges,
            ),
          ),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("최근 구매 내역", style: h6(mColor: Colors.grey)),
                      Spacer(),
                      Text("SHOP 바로가기", style: subtitle2(mColor: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
