import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/pages/survey_completion_page.dart';

import '../../../../data/dtos/my/survey_response.dart';
import '../widgets/radio_tile.dart';

class SurveyFormPage extends ConsumerWidget {
  String? _chosenValue;
  double _progressValue = 0.0;
  late int _totalQuestions;
  int _currentQuestionIndex = 0;

  late SurveyResponse _surveyResponse;

  QuestionElement get currentQuestion =>
      _surveyResponse.questionElements[_currentQuestionIndex];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_surveyResponse.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('${_currentQuestionIndex + 1} of $_totalQuestions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 6,
                child: LinearProgressIndicator(
                    value: _progressValue,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(kAccentColor2))),
            Padding(
              padding: const EdgeInsets.all(gap_m),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(gap_m),
                child: Image.asset('assets/images/survey1.png'),
              ),
            ),
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: gap_m),
            for (var choice in currentQuestion.choices)
              Column(
                children: [
                  RadioTile(
                    title: choice.choiceItem,
                    groupValue: _chosenValue,
                    onChanged: (String? value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                  SizedBox(height: gap_s),
                ],
              ),
            SizedBox(height: gap_m),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor2,
                    minimumSize: Size(150, 36),
                  ),
                  onPressed: _currentQuestionIndex > 0
                      ? () {
                          setState(() {
                            _currentQuestionIndex--;
                            _updateProgress();
                          });
                        }
                      : null,
                  child: Text('이전'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor2,
                    minimumSize: Size(150, 36),
                  ),
                  onPressed: _currentQuestionIndex < _totalQuestions - 1
                      ? () {
                          setState(() {
                            _currentQuestionIndex++;
                            _updateProgress();
                          });
                        }
                      : _completeSurvey,
                  child: Text(_currentQuestionIndex < _totalQuestions - 1
                      ? '다음'
                      : '설문 완료'),
                ),
              ],
            ),
            SizedBox(height: gap_l),
          ],
        ),
      ),
    );
  }

  void _updateProgress() {
    setState(() {
      _progressValue = (_currentQuestionIndex + 1) / _totalQuestions;
    });
  }

  void _completeSurvey() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SurveyCompletionPage()),
    );
  }
}
