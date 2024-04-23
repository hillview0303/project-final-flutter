import 'package:flutter/material.dart';
import '../../../models/challenge.dart';
import '../ongoing_challenge_detail_page.dart';

class OngoingChallengeContainer extends StatelessWidget {
  final Challenge challenge;

  const OngoingChallengeContainer({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final DateTime now = DateTime.now();
    final int daysLeft = challenge.closingTime.difference(now).inDays;

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset('assets/1.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(challenge.challengeName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('${challenge.distance} km', style: TextStyle(color: Colors.grey)),
                Text('마감까지 $daysLeft일 남음', style: TextStyle(color: Colors.red)),
                Text('이번 도전으로 ${challenge.coin} 코인 획득가능', style: TextStyle(color: Colors.yellow)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}