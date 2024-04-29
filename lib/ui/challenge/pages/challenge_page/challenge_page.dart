import 'package:flutter/material.dart';

import '../../../../data/models/challenges/challenge_detail.dart';
import '../../../../data/models/challenges/ongoing_challenge_detail.dart';
import 'widgets/available_challenge.dart';
import 'widgets/completed_challenge.dart';
import '../ongoing_challenge_detail_page/widgets/ongoing_challenge.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AvailableChallenge(title: '탐험 시작하기', challenges: upcomingChallenges),
        OngoingChallenge(title: '내 챌린지', challenges: ongoingChallenges),
        CompletedChallenge(title: '정복한 챌린지', challenges: pastChallenges),
      ],
    );
  }
}
