import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/survey_repository.dart';
import 'package:project_app/main.dart';

import '../../../../data/dtos/survey/survey_response.dart';

class SurveyListModel {
  List<SurveyResponseDTO>? joinableSurveyList;
  List<SurveyResponseDTO>? unjoinableSurveyList;

  SurveyListModel(this.joinableSurveyList, this.unjoinableSurveyList);
}

class SurveyListViewModel extends StateNotifier<SurveyListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SurveyListViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await SurveyRepository().fetchSurvey();
    if (responseDTO.status == 200) {
      List<SurveyResponseDTO> responseList = responseDTO.body;
      List<SurveyResponseDTO> joinSurveyList = [];
      List<SurveyResponseDTO> unjoinableSurveyList = [];
      responseList.forEach((survey) {
        if (survey.isAttend == "참여가능") {
          joinSurveyList.add(survey);
        } else {
          unjoinableSurveyList.add(survey);
        }
      });
      state = SurveyListModel(joinSurveyList, unjoinableSurveyList);
    }
  }
}

final surveyListProvider =
    StateNotifierProvider<SurveyListViewModel, SurveyListModel?>(
  (ref) {
    return SurveyListViewModel(null, ref)..notifyInit();
  },
);
