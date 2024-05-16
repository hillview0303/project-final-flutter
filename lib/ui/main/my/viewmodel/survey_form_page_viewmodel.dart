import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/survey/survey_response.dart';
import 'package:project_app/data/repository/survey_repository.dart';
import 'package:project_app/ui/main/my/viewmodel/survey_page_viewmodel.dart';

import '../../../../data/dtos/survey/survey_request.dart';
import '../../../../main.dart';
import '../pages/survey_completion_page.dart';

class SurveyFormModel {
  final SurveyDetailDTO? surveyDetailDTO;
  final int currentIndex;
  final double progressValue;
  final int? chosenValue;
  final List<SurveyRequestDTO>? surveyRequestDTOList;

  SurveyFormModel(
      {this.surveyDetailDTO,
      this.currentIndex = 0,
      this.progressValue = 0.0,
      this.chosenValue,
      this.surveyRequestDTOList});

  SurveyFormModel copyWith(
      {SurveyDetailDTO? surveyDetailDTO,
      int? currentIndex,
      double? progressValue,
      List<SurveyRequestDTO>? surveyRequestDTOList,
      int? chosenValue}) {
    return SurveyFormModel(
      surveyDetailDTO: surveyDetailDTO ?? this.surveyDetailDTO,
      currentIndex: currentIndex ?? this.currentIndex,
      progressValue: progressValue ?? this.progressValue,
      surveyRequestDTOList: surveyRequestDTOList ?? this.surveyRequestDTOList,
      chosenValue: chosenValue,
    );
  }
}

class SurveyFormViewModel extends StateNotifier<SurveyFormModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SurveyFormViewModel(super._state, this.ref);

  Future<void> postSurveyResult() async {
    List<SurveyRequestDTO> surveyRequestList = state!.surveyRequestDTOList!;
    if (state!.chosenValue == null) {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("선택항목이 없습니다.")));
    } else {
      surveyRequestList.add(SurveyRequestDTO(
          questionId: state!.surveyDetailDTO!
              .questionElements[state!.currentIndex].questionId,
          choiceId: state!.chosenValue));
      ResponseDTO responseDTO = await SurveyRepository().fetchSurveyResult(
          state!.surveyDetailDTO!.surveyId, surveyRequestList);

      if (responseDTO.status == 200) {
        ref.read(surveyListProvider.notifier).notifyInit();

        Navigator.pushAndRemoveUntil(
          mContext!,
          MaterialPageRoute(builder: (context) => SurveyCompletionPage()),
          (route) => true,
        );
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
            SnackBar(content: Text("설문 참여 실패: ${responseDTO.msg}")));
      }
    }
  }

  void updateChosenValue(int choiceId) {
    state = state!.copyWith(chosenValue: choiceId);
  }

  void moveToPrev() {
    state = state!.copyWith(
        currentIndex: state!.currentIndex - 1,
        progressValue: state!.currentIndex -
            1 / state!.surveyDetailDTO!.questionElements.length,
        chosenValue:
            state!.surveyRequestDTOList![state!.currentIndex - 1].choiceId);
  }

  void moveToNext() {
    List<SurveyRequestDTO> surveyRequestList = [];
    int? chosenValue;

    if (state!.surveyRequestDTOList != null) {
      surveyRequestList = state!.surveyRequestDTOList!;
    }

    if (state!.surveyRequestDTOList == null ||
        state!.currentIndex + 1 > state!.surveyRequestDTOList!.length) {
      surveyRequestList.add(SurveyRequestDTO(
          questionId: state!.surveyDetailDTO!
              .questionElements[state!.currentIndex].questionId,
          choiceId: state!.chosenValue));
      chosenValue = null;
    } else {
      if (state!.currentIndex + 1 == state!.surveyRequestDTOList!.length) {
        chosenValue = null;
      } else {
        chosenValue =
            state!.surveyRequestDTOList![state!.currentIndex + 1].choiceId;
      }
      surveyRequestList[state!.currentIndex] = SurveyRequestDTO(
          questionId: state!.surveyDetailDTO!
              .questionElements[state!.currentIndex].questionId,
          choiceId: state!.chosenValue);
    }
    state = state!.copyWith(
        surveyRequestDTOList: surveyRequestList,
        chosenValue: chosenValue,
        currentIndex: state!.currentIndex + 1,
        progressValue: state!.currentIndex +
            1 / state!.surveyDetailDTO!.questionElements.length);
  }

  Future<void> notifyInit(int surveyId) async {
    ResponseDTO responseDTO =
        await SurveyRepository().fetchSurveyDetail(surveyId);

    if (responseDTO.status == 200) {
      state = SurveyFormModel(surveyDetailDTO: responseDTO.body);
    }
  }
}

final surveyFormProvider = StateNotifierProvider.family
    .autoDispose<SurveyFormViewModel, SurveyFormModel?, int>(
  (ref, surveyId) {
    return SurveyFormViewModel(null, ref)..notifyInit(surveyId);
  },
);
