import 'package:flutter/material.dart';
import '../../../models/challenge.dart';
import '../challenge_detail_page.dart';
import 'challenge_image.dart';
import 'challenge_name.dart';
import 'hexagon_clipper.dart';

class ChallengeContainer extends StatelessWidget {
  final Challenge challenge;

  const ChallengeContainer({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 이미지의 너비와 높이 설정
    final double imageWidth = MediaQuery.of(context).size.width * 0.2;
    final double imageHeight = imageWidth; // 너비에 맞춰 정사각형으로 설정

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChallengeDetailPage(challenge: challenge)),
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
                ClipPath(
                  clipper: HexagonClipper(),
                  child: Image.asset(challenge.badgeImg, fit: BoxFit.cover, height: imageHeight, width: imageWidth),
                ),
                Positioned(
                  bottom: 4, // 육각형의 아래쪽에 위치시키기 위해 조절
                  child: Text(
                    challenge.distance,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ChallengeName(name: challenge.name),
            ),
          ],
        ),
      ),
    );
  }
}