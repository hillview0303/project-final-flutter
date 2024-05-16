class SurveyRequestDTO {
  final int? questionId;
  final int? choiceId;

  SurveyRequestDTO({this.questionId, this.choiceId});

  Map<String, dynamic> toJson() {
    return {
      "questionId": this.questionId,
      "choiceId": this.choiceId,
    };
  }
}
