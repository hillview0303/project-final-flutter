import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/size.dart';

class ChallengeActionButton extends StatelessWidget {
  final bool? status;

  const ChallengeActionButton({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == null) {
      return SizedBox(
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
      );
    } else if (status == true) {
      return Row(
        children: <Widget>[
          Icon(Icons.check_circle, color: Colors.green, size: 30),
          SizedBox(width: 8),
          Text(
            '정복한 챌린지입니다',
            style: TextStyle(
              color: Colors.green,
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
              Icon(Icons.dangerous_outlined, color: Colors.red, size: 30),
              SizedBox(width: 8),
              Text(
                '실패한 챌린지입니다',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: gap_s,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // 참가 시작 기능 구현
              },
              child: Text('다시 도전하기'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      );
    }
  }
}
