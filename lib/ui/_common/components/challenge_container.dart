import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

import '../../main/challenge/pages/challenge_detail_page.dart';
import 'challenge_name.dart';
import 'hexagon_border_painter.dart';
import 'hexagon_clipper.dart';

class ChallengeContainer extends StatelessWidget {
  final ChallengeListDTO challenge;

  const ChallengeContainer({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.2;
    final double imageHeight = imageWidth;
    double customPaintWidth = imageWidth + 10.0; // 이미지 너비에 10픽셀을 더한 크기
    double customPaintHeight = imageHeight; // 이미지와 동일한 높이

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChallengeDetailPage(challengeId: challenge.id)),
        );
      },
      child: Container(
        width: imageWidth,
        color: Colors.white.withOpacity(0.3),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CustomPaint(
                  size: Size(customPaintWidth, customPaintHeight),
                  painter: HexagonBorderPainter(
                    strokeWidth: 5.0,
                    strokeColor: kAccentColor2,
                    rotationAngle: math.pi / 6,
                  ),
                ),
                Transform.rotate(
                  angle: math.pi / 2,
                  child: ClipPath(
                    clipper: HexagonClipper(),
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
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
            SizedBox(height: 10),
            Expanded(
              child: ChallengeName(name: challenge.challengeName),
            ),
          ],
        ),
      ),
    );
  }
}