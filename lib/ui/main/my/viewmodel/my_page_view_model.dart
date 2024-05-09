import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/user_repositiry.dart';
import 'package:project_app/main.dart';

import '../../../../data/dtos/my/my_response.dart';

class MyPageModel {
  MyPageDTO myPageDTO;

  MyPageModel(this.myPageDTO);
}

class MyPageViewModel extends StateNotifier<MyPageModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  MyPageViewModel(super._state, this.ref);

  Future<void> updatedUser(ProfileUpdateFormDTO updateDTO) async {
    MyPageModel prevModel = state!;
    MyPageDTO myPageDTO = MyPageDTO(
        id: updateDTO.id,
        name: updateDTO.name,
        fat: prevModel.myPageDTO.fat,
        muscle: prevModel.myPageDTO.muscle,
        weight: prevModel.myPageDTO.weight,
        conqueredChallenge: prevModel.myPageDTO.conqueredChallenge,
        userImg: prevModel.myPageDTO.userImg);

    state = MyPageModel(myPageDTO);
  }

  Future<void> notifyInit() async {

    ResponseDTO responseDTO =
        await UserRepository().fetchMyPage();

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
