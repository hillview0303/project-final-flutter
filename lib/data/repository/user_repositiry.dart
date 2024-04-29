import 'dart:async';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:project_app/data/dtos/user/user_request.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';
import '../models/user.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._single();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._single();

  Future<ResponseDTO> fetchLogin(LoginRequestDTO requestDTO) async {
    try {
      Response reponse = await dio.post("/login", data: requestDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(reponse.data);
      responseDTO.data = User.fromJson(responseDTO.data);
      final authorization = reponse.headers["authorization"];
      if (authorization != null) {
        responseDTO.token = authorization.first;
      }
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "유저네임 혹은 비밀번호가 틀렸습니다.");
    }
  }

  Future<ResponseDTO> fetchJoin(JoinRequestDTO requestDTO) async {
    try {
      Response response = await dio.post("/join", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = User.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "유저네임이 중복됩니다.");
    }
  }
}
