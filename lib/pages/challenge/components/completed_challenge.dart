import 'package:flutter/material.dart';
import 'package:project_app/common/design/line.dart';

import '../../../common/design/size.dart';
import '../../../common/design/style.dart';
import '../../../models/challenge.dart';
import '../components/challenge_container.dart';

class CompletedChallenge extends StatelessWidget {
  final String title;
  final List<Challenge> challenges;

  const CompletedChallenge(
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
            height: 150,
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
