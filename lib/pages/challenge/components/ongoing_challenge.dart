import 'package:flutter/material.dart';
import 'package:project_app/common/design/size.dart';

import '../../../common/design/constants.dart';
import '../../../common/design/style.dart';
import '../../../models/challenge.dart';
import 'ongoing_challenge_container.dart';

class OngoingChallenge extends StatelessWidget {
  final String title;
  final List<Challenge> challenges;

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
