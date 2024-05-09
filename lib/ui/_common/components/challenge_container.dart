import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

import '../../main/challenge/pages/challenge_detail_page.dart';
import 'challenge_name.dart';
import 'hexagon_clipper.dart';

class ChallengeContainer extends StatelessWidget {
  final ChallengeListDTO challenge;

  const ChallengeContainer({Key? key, required this.challenge})
      : super(key: key);

  Color _getBackgroundColor() {
    if (challenge.status == true) {
      // 시작 가능한 챌린지
      return Colors.green.withOpacity(0.8);
    } else if (challenge.status == false) {
      // 실패한 챌린지
      return Colors.red.withOpacity(0.8);
    } else {
      // 정복한 챌린지
      return Colors.blue.withOpacity(0.8);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.2;
    final double imageHeight = imageWidth;
    double customPaintWidth = imageWidth + 20.0;
    double customPaintHeight = imageHeight + 20.0;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChallengeDetailPage(challengeId: challenge.id)),
        );
      },
      child: Container(
        width: customPaintWidth,
        color: Colors.white.withOpacity(0.3),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // 상태에 따라 다른 색상을 가진 육각형
                Transform.rotate(
                  angle: math.pi / 2,
                  child: ClipPath(
                    clipper: HexagonClipper(radius: 48),
                    child: Transform.rotate(
                      angle: -math.pi / 2,
                      child: Container(
                        color: _getBackgroundColor(),
                        height: customPaintHeight,
                        width: customPaintWidth,
                      ),
                    ),
                  ),
                ),
                // 중간 크기의 검은색 육각형
                Transform.rotate(
                  angle: math.pi / 2,
                  child: ClipPath(
                    clipper: HexagonClipper(radius: 43),
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
                // 이미지를 표시하는 육각형
                Transform.rotate(
                  angle: math.pi / 2,
                  child: ClipPath(
                    clipper: HexagonClipper(radius: 40),
                    child: Transform.rotate(
                      angle: -math.pi / 2,
                      child: Image.memory(
                        base64Decode(challenge.badgeImg),
                        fit: BoxFit.cover,
                        height: imageHeight,
                        width: imageWidth,
                      ),
                    ),
                  ),
                ),
                // 거리 표시
                Positioned(
                  bottom: imageWidth * 0.2,
                  right: 0,
                  left: imageWidth * 0.25,
                  child: Transform.rotate(
                    angle: -math.pi / 6,
                    child: Container(
                      alignment: Alignment.center,
                      width: imageWidth * 0.5,
                      child: Text(
                        challenge.distance,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(150, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ChallengeName(name: challenge.challengeName),
            ),
          ],
        ),
      ),
    );
  }
}
