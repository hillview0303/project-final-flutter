import 'package:flutter/material.dart';
import '../../models/challenge.dart';
import 'components/available_challenge.dart';
import 'components/completed_challenge.dart';
import 'components/ongoing_challenge.dart';

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