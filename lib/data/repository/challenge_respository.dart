import 'package:project_app/data/dtos/challenge/challenge_request.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class ChallengeRepository {
  // 챌린지 시작하기
  Future<ResponseDTO> insertAttendChallenge(ChallengeSaveDTO saveDTO) async {
    final response =
        await dio.post("/api/attend-challenge-save", data: saveDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      ChallengeStartDTO challengeStartDTO =
          ChallengeStartDTO.fromJson(responseDTO.body);
      responseDTO.body = challengeStartDTO;
    }

    return responseDTO;
  }

  // 챌린지 리스트
  Future<ResponseDTO> getChallengeList() async {
    final response = await dio.get("/api/challenges");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      ChallengeResponseDTO challengeResponseDTO =
          ChallengeResponseDTO.fromJson(responseDTO.body);

      responseDTO.body = challengeResponseDTO;
    }

    return responseDTO;
  }

  // 챌린지 디테일
  Future<ResponseDTO> getChallengeDetail(int challengeId) async {
    final response = await dio.get("/api/challenges/${challengeId}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      ChallengeDetailDTO challengeDetailDTO =
          ChallengeDetailDTO.fromJson(responseDTO.body);

      responseDTO.body = challengeDetailDTO;
    }

    return responseDTO;
  }
}
