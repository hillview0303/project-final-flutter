import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';
import '../../../../data/dtos/my/current_surveys.dart';
import '../../../../data/dtos/my/past_surveys.dart';
import '../widgets/survey_container.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('설문조사'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '참여 가능한 설문'),
              Tab(text: '지난 설문'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // 참여 가능한 설문 탭
            ListView(
              padding: const EdgeInsets.all(gap_ml),
              children: [
                SurveyContainer(
                  title: '설문 1',
                  questions: surveyQuestions1[0].answers,
                ),
                const SizedBox(height: gap_m),
                SurveyContainer(
                  title: '설문 2',
                  questions: surveyQuestions2[0].answers,
                ),
                const SizedBox(height: gap_m),
              ],
            ),
            // 지난 설문 탭
            ListView(
              padding: const EdgeInsets.all(gap_ml),
              children: [
                SurveyContainer(
                  title: '지난 설문 1',
                  questions: surveyQuestions3[0].answers,
                ),
                const SizedBox(height: gap_m),
                SurveyContainer(
                  title: '지난 설문 2',
                  questions: surveyQuestions4[0].answers,
                ),
                const SizedBox(height: gap_m),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
