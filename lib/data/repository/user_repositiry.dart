import 'package:project_app/_core/constants/http.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/models/user.dart';

class UserRepository {

 
  Future<ResponseDTO> fetchImageUpdate(UserImgUpdateDTO updateDTO) async {
    final response =
        await dio.put("/api/users/img-update", data: updateDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchUpdate(
      UserUpdateDTO updateDTO) async {
    final response =
        await dio.put("/api/users/update", data: updateDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchJoin(JoinRequestDTO joinRequestDTO) async {
    final response = await dio.post("/join", data: joinRequestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginRequestDTO loginReqDTO) async {
    final response = await dio.post("/login", data: loginReqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      responseDTO.body = User.fromJson(responseDTO.body);
      final accessToken = response.headers["Authorization"]!.first;

      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }

  Future<ResponseDTO> fetchMyPage() async {
    final response = await dio.get("/api/users/myPage");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> profileUpdateForm() async {
    final response = await dio.get("/api/users/update-form");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
