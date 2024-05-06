import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class TodayRepository {
  Future<ResponseDTO> fetchMainPage(String accessToken) async {
    final response = await dio.get("/api/users",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
