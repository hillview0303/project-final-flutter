import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/ui/main/my/viewmodel/profile_edit_view_model.dart';

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

  Future<ResponseDTO> fetchUpdateBodyData(UpdateBodyDataRequestDTO requestDTO,
      String accessToken) async {
    print(requestDTO.fat);
    final response = await dio.post("/api/body-date/save",
        options: Options(headers: {"Authorization": "${accessToken}"}),data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
