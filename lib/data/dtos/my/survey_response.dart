class SurveyResponse {
  final int surveyId;
  final String title;
  final List<QuestionElement> questionElements;

  SurveyResponse({
    required this.surveyId,
    required this.title,
    required this.questionElements,
  });

  factory SurveyResponse.fromJson(Map<String, dynamic> json) {
    var list = json['questionElements'] as List;
    List<QuestionElement> questionList = list.map((i) => QuestionElement.fromJson(i)).toList();

    return SurveyResponse(
      surveyId: json['surveyId'],
      title: json['title'],
      questionElements: questionList,
    );
  }
}

class QuestionElement {
  final int questionId;
  final String question;
  final List<Choice> choices;

  QuestionElement({
    required this.questionId,
    required this.question,
    required this.choices,
  });

  factory QuestionElement.fromJson(Map<String, dynamic> json) {
    var list = json['choices'] as List;
    List<Choice> choiceList = list.map((i) => Choice.fromJson(i)).toList();

    return QuestionElement(
      questionId: json['questionId'],
      question: json['question'],
      choices: choiceList,
    );
  }
}

class Choice {
  final int choiceId;
  final String choiceItem;
  final int choiceNumber;

  Choice({
    required this.choiceId,
    required this.choiceItem,
    required this.choiceNumber,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      choiceId: json['choiceId'],
      choiceItem: json['choiceItem'],
      choiceNumber: json['choiceNumber'],
    );
  }
}