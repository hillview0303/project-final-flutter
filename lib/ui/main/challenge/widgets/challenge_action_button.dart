import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/challenge/viewmodel/challenge_detail_view_model.dart';

class ChallengeActionButton extends ConsumerWidget {
  final bool? status;
  final int challengeId;

  ChallengeActionButton({this.status, required this.challengeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChallengeDetailViewModel? challengeDetailViewModel =
        ref.read(challengeDetailProvider(challengeId).notifier);

    if (status == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              challengeDetailViewModel!.startChallenge(challengeId);
            },
            child: Text('탐험 시작하기'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor2,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(fontSize: 18),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      );
    } else if (status == true) {
      return Row(
        children: <Widget>[
          Icon(Icons.check_circle, color: Colors.green.withOpacity(0.7), size: 30),
          SizedBox(width: gap_s),
          Text(
            '정복한 챌린지입니다',
            style: TextStyle(
              color: Colors.green.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: <Widget>[
              Icon(Icons.dangerous_outlined, color: Colors.red.withOpacity(0.7), size: 30),
              SizedBox(width: gap_s),
              Text(
                '실패한 챌린지입니다',
                style: TextStyle(
                  color: Colors.red.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: gap_m,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  challengeDetailViewModel!.startChallenge(challengeId);
                },
                child: Text('다시 도전하기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentColor2,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontSize: 18),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
