import 'package:flutter/material.dart';
import '../../../models/challenge.dart';
import '../challenge_detail_page.dart';
import 'challenge_image.dart';
import 'challenge_name.dart';

class ChallengeContainer extends StatelessWidget {
  final Challenge challenge;

  const ChallengeContainer({Key? key, required this.challenge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChallengeDetailPage(challenge: challenge),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        color: Colors.white.withOpacity(0.3),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChallengeImage(imagePath: 'assets/1.png'),
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
