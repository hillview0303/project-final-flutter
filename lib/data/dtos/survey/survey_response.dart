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

class SurveyDetailDTO {
  final int surveyId;
  final String surveyTitle;
  final List<QuestionElementDTO> questions;

  SurveyDetailDTO({
    required this.surveyId,
    required this.surveyTitle,
    required this.questions,
  });

  factory SurveyDetailDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevQuestionElementList = json["questions"];
    List<QuestionElementDTO> questionElementList = prevQuestionElementList
        .map((question) => QuestionElementDTO.fromJson(question))
        .toList();

    return SurveyDetailDTO(
      surveyId: json["surveyId"],
      surveyTitle: json["surveyTitle"],
      questions: questionElementList,
    );
  }
//
}

class QuestionElementDTO {
  final int questionId;
  final String questionTitle;
  final List<ChoiceDTO> choices;

  QuestionElementDTO({
    required this.questionId,
    required this.questionTitle,
    required this.choices,
  });

  factory QuestionElementDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevChoiceDTO = json["choices"];
    List<ChoiceDTO> choiceDTO =
        prevChoiceDTO.map((choice) => ChoiceDTO.fromJson(choice)).toList();

    return QuestionElementDTO(
      questionId: json["questionId"],
      questionTitle: json["questionTitle"],
      choices: choiceDTO,
    );
  }
//
}

class ChoiceDTO {
  final int choiceId;
  final String choiceTitle;
  final int choiceNumber;

  ChoiceDTO({
    required this.choiceId,
    required this.choiceTitle,
    required this.choiceNumber,
  });

  factory ChoiceDTO.fromJson(Map<String, dynamic> json) {
    return ChoiceDTO(
      choiceId: json["choiceId"],
      choiceTitle: json["choiceTitle"],
      choiceNumber: json["choiceNumber"],
    );
  }
//
}
