import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/ui/main/my/viewmodel/survey_form_page_viewmodel.dart';

import '../widgets/radio_tile.dart';

class SurveyFormPage extends ConsumerWidget {
  final surveyId;

  SurveyFormPage(this.surveyId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SurveyFormModel? model = ref.watch(surveyFormProvider(surveyId));
    SurveyFormViewModel viewModel =
        ref.read(surveyFormProvider(surveyId).notifier);

    if (model == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(model!.surveyDetailDTO!.title!),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  '${model.currentIndex + 1} of ${model!.surveyDetailDTO!.questionElements.length}',
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
                      value: model.progressValue,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(kAccentColor2))),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(gap_m),
                  child: Image.asset('assets/images/survey1.png'),
                ),
              ),
              Text(
                model.surveyDetailDTO!.questionElements[model.currentIndex]
                    .question,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: gap_m),
              for (var choice in model.surveyDetailDTO!
                  .questionElements[model.currentIndex].choices)
                Column(
                  children: [
                    RadioTile(
                      choice: choice,
                      groupValue: model.chosenValue,
                      onChanged: (int? value) {
                        viewModel.updateChosenValue(value!);
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
                    onPressed: model.currentIndex > 0
                        ? () {
                            viewModel.moveToPrev();
                          }
                        : null,
                    child: Text('이전'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccentColor2,
                      minimumSize: Size(150, 36),
                    ),
                    onPressed: model.currentIndex <
                            model.surveyDetailDTO!.questionElements.length - 1
                        ? () {
                            if (model.chosenValue == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("선택된 항목이 없습니다.")));
                            } else {
                              viewModel.moveToNext();
                            }
                          }
                        : () {
                            viewModel.postSurveyResult();
                          },
                    child: Text(model.currentIndex <
                            model!.surveyDetailDTO!.questionElements.length - 1
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
  }
}
