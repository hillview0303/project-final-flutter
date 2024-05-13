class SurveyResponse {
  final int surveyId;
  final String title;
  final List<QuestionElement> questionElements;

  SurveyResponse({
    required this.surveyId,
    required this.title,
    required this.questionElements,
  });
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
}


final List<SurveyResponse> surveyResponses = [
  SurveyResponse(
    surveyId: 1,
    title: '설문조사 1',
    questionElements: [
      QuestionElement(
        questionId: 1,
        question: '하루 평균 수면 시간은 얼마나 되십니까?',
        choices: [
          Choice(choiceId: 1, choiceItem: '6시간 미만', choiceNumber: 1),
          Choice(choiceId: 2, choiceItem: '6시간 - 8시간', choiceNumber: 2),
          Choice(choiceId: 3, choiceItem: '8시간 이상', choiceNumber: 3),
          Choice(choiceId: 4, choiceItem: '불규칙', choiceNumber: 4),
        ],
      ),
      QuestionElement(
        questionId: 2,
        question: '주로 언제 잠을 자십니까?',
        choices: [
          Choice(choiceId: 1, choiceItem: '밤에', choiceNumber: 1),
          Choice(choiceId: 2, choiceItem: '낮에', choiceNumber: 2),
          Choice(choiceId: 3, choiceItem: '불규칙', choiceNumber: 3),
        ],
      ),
    ],
  ),
  SurveyResponse(
    surveyId: 2,
    title: '설문조사 2',
    questionElements: [
      QuestionElement(
        questionId: 1,
        question: '하루에 커피를 얼마나 마시나요?',
        choices: [
          Choice(choiceId: 1, choiceItem: '한 잔도 안 마신다', choiceNumber: 1),
          Choice(choiceId: 2, choiceItem: '1-2잔', choiceNumber: 2),
          Choice(choiceId: 3, choiceItem: '3-4잔', choiceNumber: 3),
          Choice(choiceId: 4, choiceItem: '5잔 이상', choiceNumber: 4),
        ],
      ),
      QuestionElement(
        questionId: 2,
        question: '주로 어떤 시간에 커피를 마시나요?',
        choices: [
          Choice(choiceId: 1, choiceItem: '아침', choiceNumber: 1),
          Choice(choiceId: 2, choiceItem: '점심', choiceNumber: 2),
          Choice(choiceId: 3, choiceItem: '저녁', choiceNumber: 3),
          Choice(choiceId: 4, choiceItem: '밤', choiceNumber: 4),
        ],
      ),
    ],
  ),
];

