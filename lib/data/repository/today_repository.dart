import 'package:dio/dio.dart';
import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';
import '../dtos/today/today_request.dart';

class TodayRepository {
  Future<ResponseDTO> fetchMainPage(String accessToken) async {
    final response = await dio.get("/api/users",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchUpdateBodyData(
      UpdateBodyDataRequestDTO requestDTO, String accessToken) async {
    final response = await dio.post("/api/body-date/save",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchAddGoalFat(
      AddGoalDataRequestDTO requestDTO, String accessToken) async {
    final response = await dio.put("/api/users/goalFat-update",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchAddGoalMuscle(AddGoalDataRequestDTO requestDTO, String accessToken) async {
    final response = await dio.put("/api/users/goalMuscle-update",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO>  fetchAddGoalWeight(AddGoalDataRequestDTO requestDTO, String accessToken) async {
    final response = await dio.put("/api/users/goalWeight-update",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
