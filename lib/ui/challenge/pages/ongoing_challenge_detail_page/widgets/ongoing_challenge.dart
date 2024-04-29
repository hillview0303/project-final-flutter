import 'package:flutter/material.dart';

import '../../../../../_core/constants/constants.dart';
import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../../data/models/challenges/ongoing_challenge_detail.dart';
import 'ongoing_challenge_container.dart';

class OngoingChallenge extends StatelessWidget {
  final String title;
  final List<OngoingChallengeDetail> challenges;

  const OngoingChallenge(
      {Key? key, required this.title, required this.challenges})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAccentColor1,
      width: double.infinity,
      padding: EdgeInsets.all(gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title, style: h6(mColor: Colors.white)),
          ),
          Column(
            children: challenges
                .map((challenge) =>
                    OngoingChallengeContainer(challenge: challenge))
                .toList(),
          ),
        ],
      ),
    );
  }
}
