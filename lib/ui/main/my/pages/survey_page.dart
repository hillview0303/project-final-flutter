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
            ListView.builder(
              padding: const EdgeInsets.all(gap_ml),
              itemCount: currentSurveys.length,
              itemBuilder: (context, index) {
                final survey = currentSurveys[index];
                return Column(
                  children: [
                    SurveyContainer(
                      title: survey.title,
                      questionCount: survey.questionCount,
                      isAttend: survey.isAttend,
                      progress: survey.progress,
                    ),
                    const SizedBox(height: gap_m),
                  ],
                );
              },
            ),
            // 지난 설문 탭
            ListView.builder(
              padding: const EdgeInsets.all(gap_ml),
              itemCount: pastSurveys.length,
              itemBuilder: (context, index) {
                final survey = pastSurveys[index];
                return Column(
                  children: [
                    SurveyContainer(
                      title: survey.title,
                      questionCount: survey.questionCount,
                      isAttend: survey.isAttend,
                      progress: survey.progress,
                    ),
                    const SizedBox(height: gap_m),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
