import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/viewmodel/survey_page_viewmodel.dart';

import '../widgets/survey_container.dart';

class SurveyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SurveyListModel? model = ref.watch(surveyListProvider);

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
            model == null || model.joinableSurveyList!.length < 1
                ? Center(
                    child: Text(
                      "참여 가능한 설문이 없습니다.",
                      style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                    ),
                  )
                : // 참여 가능한 설문 탭
                ListView.builder(
                    padding: const EdgeInsets.all(gap_ml),
                    itemCount: model!.joinableSurveyList!.length,
                    itemBuilder: (context, index) {
                      final survey = model!.joinableSurveyList![index];
                      return Column(
                        children: [
                          SurveyContainer(
                            title: survey.title!,
                            questionCount: survey.questionCount!,
                            isAttend: survey.isAttend!,
                            progress: survey.progress!,
                          ),
                          const SizedBox(height: gap_m),
                        ],
                      );
                    },
                  ),
            model == null || model.unjoinableSurveyList!.length < 1
                ? Center(
                    child: Text(
                      "참여한 설문이 없습니다.",
                      style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                    ),
                  )
                :
                // 지난 설문 탭
                ListView.builder(
                    padding: const EdgeInsets.all(gap_ml),
                    itemCount: model!.unjoinableSurveyList!.length,
                    itemBuilder: (context, index) {
                      final survey = model!.unjoinableSurveyList![index];
                      return Column(
                        children: [
                          SurveyContainer(
                            title: survey.title!,
                            questionCount: survey.questionCount!,
                            isAttend: survey.isAttend!,
                            progress: survey.progress!,
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
