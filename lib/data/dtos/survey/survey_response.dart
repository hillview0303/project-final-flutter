class Survey {
  final int? id;
  final String? title;
  final String? isAttend;
  final String? progress;
  final int? questionCount;

  Survey({
    this.id,
    this.title,
    this.isAttend,
    this.progress,
    this.questionCount,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json["id"],
      title: json["title"],
      isAttend: json["isAttend"],
      progress: json["progress"],
      questionCount: json["questionCount"],
    );
  }
//
}
