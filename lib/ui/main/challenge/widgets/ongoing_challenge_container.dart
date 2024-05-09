import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import '../../../_common/components/hexagon_clipper.dart';
import '../pages/ongoing_challenge_detail_page.dart';
import 'no_challenge_text.dart';

class OngoingChallengeContainer extends StatelessWidget {
  final AttendChallenge? challenge;

  const OngoingChallengeContainer({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int daysLeft = challenge?.closingTime?.difference(now).inDays ?? 0;

    if (challenge == null) {
      return NoChallengeText("진행중인 챌린지가 없습니다.");
    } else {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OngoingChallengeDetailPage(challenge: challenge),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(5),
                  child: Transform.rotate(
                    angle: math.pi / 2, // 90도 회전
                    child: ClipPath(
                      clipper: HexagonClipper(radius: 40),
                      child: Transform.rotate(
                        angle: -math.pi / 2, // 이미지를 반대 방향으로 90도 회전하여 원래 상태 유지
                        child: Image.memory(
                            base64Decode(challenge!.backImg!),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge!.challengeName!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, color: kAccentColor2),
                      ),
                      Text(
                        '${challenge!.subtitle}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      if (challenge!.closingTime != null)
                        Text(
                          '마감까지 $daysLeft일 남음',
                          style: TextStyle(color: Colors.red),
                        ),
                      Text(
                        '이번 도전으로 ${challenge!.coin} 코인 획득가능',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}