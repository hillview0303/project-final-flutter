import 'package:flutter/material.dart';
import '../../../models/challenge.dart';

class OngoingChallengeContainer extends StatelessWidget {
  final Challenge challenge;

  const OngoingChallengeContainer({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7), // 흰색 반투명 배경으로 내부 컨테이너를 강조
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.teal.shade100,  // 아이콘 배경을 밝은 teal로 설정
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
                Text(challenge.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('${challenge.distance} km', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}