class SurveyResponseDTO {
  final int? id;
  final String? title;
  final String? isAttend;
  final String? progress;
  final int? questionCount;

  SurveyResponseDTO({
    this.id,
    this.title,
    this.isAttend,
    this.progress,
    this.questionCount,
  });

  factory SurveyResponseDTO.fromJson(Map<String, dynamic> json) {
    return SurveyResponseDTO(
      id: json["id"],
      title: json["title"],
      isAttend: json["isAttend"],
      progress: json["progress"],
      questionCount: json["questionCount"],
    );
  }
//
}
