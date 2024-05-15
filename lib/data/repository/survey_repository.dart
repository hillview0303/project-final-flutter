import 'package:project_app/_core/constants/http.dart';

import '../dtos/response_dto.dart';
import '../dtos/survey/survey_request.dart';
import '../dtos/survey/survey_response.dart';

class SurveyRepository {
  Future<ResponseDTO> fetchSurveyResult(
      int surveyId, List<SurveyRequestDTO> surveyRequestDTOList) async {
    final response = await dio.post("/api/survey/${surveyId}",
        data: surveyRequestDTOList.map((e) => e.toJson()).toList());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchSurvey() async {
    final response = await dio.get("/api/survey");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevList = responseDTO.body;
      List<SurveyResponseDTO> surveyList =
          prevList.map((e) => SurveyResponseDTO.fromJson(e)).toList();

      responseDTO.body = surveyList;
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchSurveyDetail(int surveyId) async {
    final response = await dio.get("/api/survey/${surveyId}");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      SurveyDetailDTO surveyDetailDTO =
          SurveyDetailDTO.fromJson(responseDTO.body);

      responseDTO.body = surveyDetailDTO;
    }

    return responseDTO;
  }
}
