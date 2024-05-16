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
  final String title;
  final List<QuestionElementDTO> questionElements;

  SurveyDetailDTO({
    required this.surveyId,
    required this.title,
    required this.questionElements,
  });

  factory SurveyDetailDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevQuestionElementList = json["questionElements"];
    List<QuestionElementDTO> questionElementList = prevQuestionElementList
        .map((question) => QuestionElementDTO.fromJson(question))
        .toList();

    return SurveyDetailDTO(
      surveyId: json["surveyId"],
      title: json["title"],
      questionElements: questionElementList,
    );
  }
//
}

class QuestionElementDTO {
  final int questionId;
  final String question;
  final List<ChoiceDTO> choices;

  QuestionElementDTO({
    required this.questionId,
    required this.question,
    required this.choices,
  });

  factory QuestionElementDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevChoiceDTO = json["choices"];
    List<ChoiceDTO> choiceDTO =
        prevChoiceDTO.map((choice) => ChoiceDTO.fromJson(choice)).toList();

    return QuestionElementDTO(
      questionId: json["questionId"],
      question: json["question"],
      choices: choiceDTO,
    );
  }
//
}

class ChoiceDTO {
  final int choiceId;
  final String choiceItem;
  final int choiceNumber;

  ChoiceDTO({
    required this.choiceId,
    required this.choiceItem,
    required this.choiceNumber,
  });

  factory ChoiceDTO.fromJson(Map<String, dynamic> json) {
    return ChoiceDTO(
      choiceId: json["choiceId"],
      choiceItem: json["choiceItem"],
      choiceNumber: json["choiceNumber"],
    );
  }
//
}
