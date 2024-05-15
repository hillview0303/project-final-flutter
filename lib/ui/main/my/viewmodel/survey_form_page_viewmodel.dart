import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/survey/survey_response.dart';
import 'package:project_app/data/repository/survey_repository.dart';

import '../../../../main.dart';

class SurveyFormModel {
  final SurveyResponseDTO? surveyResponseDTO;

  SurveyFormModel(this.surveyResponseDTO);
}

class SurveyFormViewModel extends StateNotifier<SurveyFormModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SurveyFormViewModel(super._state, this.ref);

  Future<void> notifyInit(int surveyId) async {
    ResponseDTO responseDTO =
        await SurveyRepository().fetchSurveyDetail(surveyId);

    if (responseDTO.status == 200) {
      state = SurveyFormModel(responseDTO.body);
    }
  }
}

final surveyFormProvider = StateNotifierProvider.family
    .autoDispose<SurveyFormViewModel, SurveyFormModel?, int>(
  (ref, surveyId) {
    return SurveyFormViewModel(null, ref)..notifyInit(surveyId);
  },
);
