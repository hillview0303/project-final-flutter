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

final List<Survey> currentSurveys = [
  Survey(id: 1, title: '설문조사1', isAttend: '참여가능', progress: '진행중', questionCount: 19),
  Survey(id: 2, title: '설문조사2', isAttend: '참여가능', progress: '진행중', questionCount: 15),
];