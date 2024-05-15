import 'package:project_app/_core/constants/http.dart';

import '../dtos/response_dto.dart';
import '../dtos/survey/survey_response.dart';

class SurveyRepository {
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
      SurveyResponseDTO surveyResponseDTO =
          SurveyResponseDTO.fromJson(responseDTO.body);

      responseDTO.body = surveyResponseDTO;
    }

    return responseDTO;
  }
}
