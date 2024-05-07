import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_response.dart';
import 'package:project_app/data/repository/user_repositiry.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';


class MyPageModel {
  MyPageDTO myPageDTO;

  MyPageModel(this.myPageDTO);
}

class MyPageViewModel extends StateNotifier<MyPageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  MyPageViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);

    ResponseDTO responseDTO =
        await UserRepository().fetchMyPage(sessionStore.accessToken!);

    MyPageModel myPageModel = MyPageModel(MyPageDTO.fromJson(responseDTO.body));
    if (responseDTO.status == 200) {
      state = myPageModel;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("마이페이지 정보 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final myPageProvider = StateNotifierProvider<MyPageViewModel, MyPageModel?>(
  (ref) {
    return MyPageViewModel(null, ref)..notifyInit();
  },
);
