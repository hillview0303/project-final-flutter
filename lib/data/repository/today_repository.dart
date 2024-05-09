import 'package:dio/dio.dart';
import '../../_core/constants/http.dart';
import '../../ui/main/today/viewmodel/today_page_viewmodel.dart';
import '../dtos/response_dto.dart';
import '../dtos/today/today_request.dart';
import '../dtos/today/today_response.dart';

class TodayRepository {
  Future<ResponseDTO> fetchMainPage() async {
    final response = await dio.get("/api/users");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200){
      List<dynamic> temp = responseDTO.body["bodyData"];
      List<BodyDataDTO> bodyDataList = temp.map((e) => BodyDataDTO.fromJson(e)).toList();
      MainDTO mainDTO = MainDTO.fromJson(responseDTO.body);
      TodayPageModel model = TodayPageModel(mainDTO: mainDTO, bodyData: bodyDataList);
      responseDTO.body = model;

    }
    return responseDTO;
  }

  Future<ResponseDTO> fetchUpdateBodyData(AddBodyDataRequestDTO requestDTO) async {
    final response = await dio.post("/api/body-date/save",data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO ;
  }


  Future<ResponseDTO> fetchAddGoalFat(
      AddGoalFatRequestDTO requestDTO) async {
    final response = await dio.put("/api/users/goalFat-update",data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchAddGoalMuscle(AddGoalMuscleRequestDTO requestDTO) async {
    final response = await dio.put("/api/users/goalMuscle-update", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO>  fetchAddGoalWeight(AddGoalWeightRequestDTO requestDTO) async {
    final response = await dio.put("/api/users/goalWeight-update", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
