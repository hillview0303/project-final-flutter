import 'package:dio/dio.dart';
import 'package:project_app/data/dtos/challenge/challenge_request.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class ChallengeRepository {
  // 챌린지 시작하기
  Future<ResponseDTO> insertAttendChallenge(
      ChallengeSaveDTO saveDTO, String accessToken) async {
    final response = await dio.post("/api/attend-challenge-save",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        data: saveDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  // 챌린지 리스트
  Future<ResponseDTO> getChallengeList(String accessToken) async {
    final response = await dio.get("/api/challenges",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  // 챌린지 디테일
  Future<ResponseDTO> getChallengeDetail(
      int challengeId, String accessToken) async {
    final response = await dio.get("/api/challenges/${challengeId}",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
