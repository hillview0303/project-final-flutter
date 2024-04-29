import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../_core/constants/http.dart';
import '../../_core/constants/move.dart';
import '../../main.dart';
import '../dtos/response_dto.dart';
import '../dtos/user/user_request.dart';
import '../models/user.dart';
import '../repository/user_repositiry.dart';

// 창고 관리자
final sessionProvider = Provider<SessionStore>(
  (ref) {
    return SessionStore();
  },
);

// 창고
class SessionUser {
  User? user;

  String? jwt;
  bool? isLogin;
}

class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  //로그인
  Future<void> login(LoginReqDTO) async {
    Logger().d("login");

    ResponseDTO responseDTO = await UserRepository().fetchLogin(LoginReqDTO);

    if (responseDTO.code == 1) {
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      this.user = responseDTO.data;
      this.jwt = responseDTO.token!;
      this.isLogin = true;

      Navigator.popAndPushNamed(mContext!, Move.mainPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}")));
    }
  }

//회원가입
  Future<void> join(JoinRequestDTO requestDTO) async {
    Logger().d("join");

    ResponseDTO responseDTO = await UserRepository().fetchJoin(requestDTO);

    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("회원가입 실패")));
    }
  }

//로그아웃
  Future<void> logout() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 jwt 삭제");
  }
}
