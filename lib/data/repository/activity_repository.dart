import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:project_app/ui/main/activity/viewmodel/activity_main_viewmodel.dart';
import 'package:project_app/ui/main/activity/viewmodel/change_weight_viewmodel.dart';
import 'package:project_app/ui/main/activity/viewmodel/drink_water_viewmoddel..dart';

import '../../_core/constants/http.dart';
import '../dtos/activity/activity_response.dart';
import '../dtos/response_dto.dart';

class ActivityRepository {
  Future<ResponseDTO> fetchChangeWeight() async {
    final response = await dio.get("/api/activities/body-date");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> tempFat = responseDTO.body["fatTimeLine"];
      List<dynamic> tempMuscle = responseDTO.body["muscleTimeLine"];
      List<dynamic> tempWeight = responseDTO.body["weightTimeLine"];

      List<FatTimeLineDTO> fatList =
          tempFat.map((e) => FatTimeLineDTO.fromJson(e)).toList();
      List<MuscleTimeLineDTO> muscleList =
          tempMuscle.map((e) => MuscleTimeLineDTO.fromJson(e)).toList();
      List<WeightTimeLineDTO> weightList =
          tempWeight.map((e) => WeightTimeLineDTO.fromJson(e)).toList();
      ChangeBodyDataDTO changeBodyData =
          ChangeBodyDataDTO.fromJson(responseDTO.body);
      ChangeWeightModel model =
          ChangeWeightModel(changeBodyData, fatList, muscleList, weightList);

      responseDTO.body = model;
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchActivityMain(String formattedDate) async {

    final response = await dio.get("/api/activities/date/${formattedDate}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);


    if (responseDTO.status == 200) {

      ActivitiesDateDTO activitiesDateDTO =
          ActivitiesDateDTO.fromJson(responseDTO.body);
      print("날짜 : ${activitiesDateDTO.createdAt}");
      print("걸음수 : ${activitiesDateDTO.walking}");
      print("몸무게 : ${activitiesDateDTO.weight}");
      print("물  : ${activitiesDateDTO.weight}");
      print("칼로리  : ${activitiesDateDTO.kcal}");

      ActivityMainModel model = ActivityMainModel(activitiesDateDTO);

      responseDTO.body = model;
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchDrinkWater() async {
    final response = await dio.get("/api/activities/water/detail");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);


    if(responseDTO.status == 200){
      List<dynamic> tempWater = responseDTO.body["weakWater"];
      List<WeakWaterDTO> weakWaterDTO = tempWater.map((e) => WeakWaterDTO.fromJson(e)).toList();
      DrinkWaterDTO drinkWaterDTO = DrinkWaterDTO.fromJson(responseDTO.body);
      DrinkWaterModel model = DrinkWaterModel(drinkWaterDTO, weakWaterDTO);
      responseDTO.body = model ;
    }

    return responseDTO ;


  }
}
