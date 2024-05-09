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
    final double imageWidth = MediaQuery.of(context).size.width * 0.2;
    final double imageHeight = imageWidth;
    final double customPaintWidth = imageWidth + 30.0;
    final double customPaintHeight = imageHeight + 30.0;

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
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: customPaintWidth,
                  height: customPaintHeight,
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 바깥쪽 육각형
                      Transform.rotate(
                        angle: math.pi / 2,
                        child: ClipPath(
                          clipper: HexagonClipper(radius: imageWidth / 2 + 10),
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Container(
                              color: Colors.yellow.withOpacity(0.5),
                              height: customPaintHeight,
                              width: customPaintWidth,
                            ),
                          ),
                        ),
                      ),
                      // 검은색 육각형 배경
                      Transform.rotate(
                        angle: math.pi / 2,
                        child: ClipPath(
                          clipper: HexagonClipper(radius: imageWidth / 2 + 5),
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Container(
                              color: Colors.black54,
                              height: customPaintHeight,
                              width: customPaintWidth,
                            ),
                          ),
                        ),
                      ),
                      // 이미지 육각형
                      Transform.rotate(
                        angle: math.pi / 2,
                        child: ClipPath(
                          clipper: HexagonClipper(radius: imageWidth / 2),
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Image.memory(
                              base64Decode(challenge!.backImg!),
                              fit: BoxFit.cover,
                              height: imageHeight,
                              width: imageWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge!.challengeName!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kAccentColor2,
                        ),
                      ),
                      Text(
                        '${challenge!.subtitle}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      if (challenge!.closingTime != null)
                        Text(
                          '마감까지 $daysLeft일 남음',
                          style: const TextStyle(color: Colors.red),
                        ),
                      const Text(
                        '이번 도전으로 코인 획득 가능',
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
