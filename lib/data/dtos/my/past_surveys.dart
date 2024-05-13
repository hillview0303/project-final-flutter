class Survey {
  final int id;
  final String title;
  final String isAttend;
  final String progress;
  final int questionCount;

  Survey({
    required this.id,
    required this.title,
    required this.isAttend,
    required this.progress,
    required this.questionCount,
  });
}

final List<Survey> pastSurveys = [
  Survey(id: 3, title: '지난 설문 1', isAttend: '참여불가', progress: '종료', questionCount: 10),
  Survey(id: 4, title: '지난 설문 2', isAttend: '참여불가', progress: '종료', questionCount: 8),
];