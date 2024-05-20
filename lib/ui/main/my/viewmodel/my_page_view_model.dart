import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/today/today_response.dart';
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

  void updateBodyData(AddBodyDTO addBodyDTO) {
    MyPageModel prevModel = state!;
    MyPageDTO myPageDTO = prevModel.myPageDTO;

    MyPageModel newModel = MyPageModel(MyPageDTO(
        id: myPageDTO.id,
        name: myPageDTO.name,
        fat: addBodyDTO.fat,
        muscle: addBodyDTO.muscle,
        weight: addBodyDTO.weight,
        userImg: myPageDTO.userImg));

    state = newModel;
  }

  // 통신 없이 프로필 이미지 상태 변경
  void updateUserImg(String userImg) {
    MyPageModel prevModel = state!;

    MyPageModel newModel = MyPageModel(MyPageDTO(
        id: prevModel.myPageDTO.id,
        name: prevModel.myPageDTO.name,
        fat: prevModel.myPageDTO.fat,
        muscle: prevModel.myPageDTO.muscle,
        weight: prevModel.myPageDTO.weight,
        conqueredChallenge: prevModel.myPageDTO.conqueredChallenge,
        userImg: userImg));

    state = newModel;
  }

  // 통신 없이 유저정보 업데이트 후 상태변경
  void updatedUser(ProfileUpdateFormDTO updateDTO) {
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
    ResponseDTO responseDTO = await UserRepository().fetchMyPage();

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
