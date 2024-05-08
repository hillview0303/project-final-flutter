import 'package:flutter/material.dart';

class OngoingChallengeImg extends StatelessWidget {
  final double progress; // 진행 상황 값을 저장하는 변수

  const OngoingChallengeImg({
    Key? key,
    required this.progress, // 진행 상황을 필수 인자로 받음
  }) : super(key: key);

  // 진행 상황에 따라 적절한 GIF 경로를 반환하는 함수
  String _getGifPath(double progress) {
    int progressStep = (progress * 100).floor(); // 소수점을 버리고 정수로 변환
    int imageIndex = (progressStep / 10).floor(); // 10% 단위로 계산

    // 100% 진행률
    if (progressStep == 100) {
      return 'assets/images/map11.gif';
    }

    return 'assets/images/map${imageIndex + 1}.gif';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        _getGifPath(progress), // 진행 상황에 따라 이미지를 동적으로 선택
        fit: BoxFit.contain,
      ),
    );
  }
}