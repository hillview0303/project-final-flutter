import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:project_app/ui/main/activity/viewmodel/change_weight_viewmodel.dart';

import '../../_core/constants/http.dart';
import '../dtos/activity/activity_response.dart';
import '../dtos/response_dto.dart';

class ActivityRepository{

  Future<ResponseDTO> fetchChangeWeight(String accessToken) async {
    final response = await dio.get("/api/activities/body-date");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    print(responseDTO.body["fatTimeLine"]);

    if(responseDTO.status == 200){

      List<dynamic> tempFat = responseDTO.body["fatTimeLine"];
      List<dynamic> tempMuscle = responseDTO.body["muscleTimeLine"];
      List<dynamic> tempWeight = responseDTO.body["weightTimeLine"];

      List<FatTimeLineDTO> fatList = tempFat.map((e) => FatTimeLineDTO.fromJson(e)).toList();

      List<MuscleTimeLineDTO> muscleList = tempMuscle.map((e) => MuscleTimeLineDTO.fromJson(e)).toList();

      List<WeightTimeLineDTO> weightList = tempWeight.map((e) => WeightTimeLineDTO.fromJson(e)).toList();

      ChangeBodyDataDTO changeBodyData = ChangeBodyDataDTO.fromJson(responseDTO.body);

      ChangeWeightModel model = ChangeWeightModel(changeBodyData, fatList, muscleList, weightList);

      responseDTO.body = model ;

    }


    return responseDTO ;
  }

}