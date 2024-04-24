import 'package:flutter/material.dart';
import '../../../models/challenge.dart';

class ChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;

  const ChallengeDetailPage({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(challenge.challengeName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              challenge.backgroundImg,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    challenge.challengeName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    "${challenge.location} ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${challenge.distance.toStringAsFixed(2)} m", // 거리 표시 수정
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Text(
                    challenge.content,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  if (challenge.status == ChallengeStatus.pending) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // 참가 시작 기능 구현
                        },
                        child: Text('탐험 시작하기'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ] else if (challenge.status == ChallengeStatus.completed) ...[
                    Row(
                      children: <Widget>[
                        Icon(Icons.check_circle, color: Colors.green, size: 30),
                        SizedBox(width: 8),  // 아이콘과 텍스트 사이의 간격
                        Text(
                          '정복한 챌린지입니다',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}