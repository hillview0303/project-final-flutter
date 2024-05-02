import 'package:flutter/material.dart';
import 'package:project_app/ui/main/challenge/widgets/available_challenge.dart';
import 'package:project_app/ui/main/challenge/widgets/completed_challenge.dart';
import 'package:project_app/ui/main/challenge/widgets/ongoing_challenge.dart';

import '../../../data/models/challenges/challenge_detail.dart';
import '../../../data/models/challenges/ongoing_challenge_detail.dart';




class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AvailableChallenge(title: '탐험 시작하기', challenges: upcomingChallenges),
        OngoingChallenge(title: '내 챌린지', challenges: ongoingChallenges),
        CompletedChallenge(title: '지난 챌린지', challenges: pastChallenges),
      ],
    );
  }
}
