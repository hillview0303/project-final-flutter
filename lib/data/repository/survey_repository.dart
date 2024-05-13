import 'package:project_app/_core/constants/http.dart';

import '../dtos/response_dto.dart';
import '../dtos/survey/survey_response.dart';

class SurveyRepository {
  Future<ResponseDTO> fetchSurvey() async {
    final response = await dio.get("/api/survey");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> prevList = responseDTO.body;
      List<Survey> surveyList =
          prevList.map((e) => Survey.fromJson(e)).toList();

      responseDTO.body = surveyList;
    }

    return responseDTO;
  }
}
