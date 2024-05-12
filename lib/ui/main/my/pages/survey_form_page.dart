import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/pages/survey_completion_page.dart';
import '../../../../data/dtos/my/current_surveys.dart';
import '../widgets/radio_tile.dart';

class SurveyFormPage extends StatefulWidget {
  @override
  _SurveyFormPageState createState() => _SurveyFormPageState();
}

class _SurveyFormPageState extends State<SurveyFormPage> {
  String? _chosenValue;
  double _progressValue = 0.0;
  late int _totalQuestions;
  int _currentQuestionIndex = 0;

  late List<CurrentServeys> _currentSurveyQuestions;

  @override
  void initState() {
    super.initState();
    _currentSurveyQuestions = surveyQuestions1;
    _totalQuestions = _currentSurveyQuestions.length;
  }

  CurrentServeys get currentQuestion => _currentSurveyQuestions[_currentQuestionIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설문조사 제목'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('${_currentQuestionIndex + 1} of $_totalQuestions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
                valueColor: AlwaysStoppedAnimation<Color>(kAccentColor2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(gap_m),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(gap_m),
                child: Image.asset('assets/images/survey1.png'),
              ),
            ),
            Text(
              currentQuestion.questionText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: gap_m),
            for (var answer in currentQuestion.answers)
              Column(
                children: [
                  RadioTile(
                    title: answer,
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
                  onPressed: _currentQuestionIndex > 0 ? () {
                    setState(() {
                      _currentQuestionIndex--;
                      _updateProgress();
                    });
                  } : null,
                  child: Text('이전'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor2,
                    minimumSize: Size(150, 36),
                  ),
                  onPressed: _currentQuestionIndex < _totalQuestions - 1 ? () {
                    setState(() {
                      _currentQuestionIndex++;
                      _updateProgress();
                    });
                  } : _completeSurvey,
                  child: Text(_currentQuestionIndex < _totalQuestions - 1 ? '다음' : '설문 완료'),
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
