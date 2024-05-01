import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/http.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/repository/user_repositiry.dart';

import '../models/user.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool? isLogin = false;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  Future<void> login(LoginRequestDTO requestDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(requestDTO);

    if (responseDTO.status == 200) {
      await secureStorage.write(key: "accessToken", value: accessToken);
      this.user = responseDTO.body;
      this.accessToken = accessToken;
      this.isLogin = true;
    }
  }

  SessionStore();
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
