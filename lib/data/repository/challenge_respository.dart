import 'package:dio/dio.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class ChallengeRepository {
  Future<ResponseDTO> getChallengeList(String accessToken) async {
    final response = await dio.get("/api/challenges",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> getChallengeDetail(
      int challengeId, String accessToken) async {
    final response = await dio.get("/api/challenges/${challengeId}",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    print("challengeId : ${challengeId}");
    print("accessToken : ${accessToken}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
