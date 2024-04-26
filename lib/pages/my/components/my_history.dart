import 'package:flutter/material.dart';
import 'package:project_app/common/design/size.dart';
import 'package:project_app/common/design/style.dart';

import 'package:project_app/pages/challenge/layout/completed_challenge.dart';

import '../../../data/models/challenges/challenge_detail.dart';


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
              title: "지난 챌린지 보기",
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
