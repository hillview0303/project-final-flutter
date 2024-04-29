import 'package:flutter/material.dart';

import '../../../../../_core/constants/line.dart';
import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../../data/models/challenges/challenge_detail.dart';
import '../../../../_common/components/challenge_container.dart';

class AvailableChallenge extends StatelessWidget {
  final String title;
  final List<ChallengeDetail> challenges;

  const AvailableChallenge(
      {Key? key, required this.title, required this.challenges})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(title, style: h6(mColor: Colors.grey)),
          ),
          line1,
          Container(
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: challenges.length,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                return ChallengeContainer(challenge: challenges[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
