enum ChallengeStatus {
  available,   // 참여 가능
  ongoing,     // 참여 중
  completed    // 참여 완료
}

class Challenge {
  final String challengeName;
  final String content;
  final int openingTime;
  final double closedTime;
  final ChallengeStatus status;  // 챌린지 상태 추가

  Challenge({
    required this.challengeName,
    required this.content,
    required this.openingTime,
    required this.closedTime,
    required this.status,
  });
}