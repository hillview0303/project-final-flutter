import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import 'package:project_app/ui/main/challenge/viewmodel/ongoing_challenge_viewmodel.dart';

import '../../../../../_core/constants/constants.dart';
import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import 'ongoing_challenge_container.dart';

class OngoingChallenge extends ConsumerWidget {
  final String title;
  final AttendChallenge? challenge;

  const OngoingChallenge(
      {Key? key, required this.title, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.read(OngoingChallengeProvider.notifier).notifyInit();

    return Container(
      color: kAccentColor2,
      width: double.infinity,
      padding: EdgeInsets.all(gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title, style: h6(mColor: Colors.white)),
          ),
          OngoingChallengeContainer(challenge: challenge),
        ],
      ),
    );
  }
}
