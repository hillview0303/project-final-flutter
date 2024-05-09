import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/repository/user_repositiry.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';

import '../../../../data/dtos/my/my_response.dart';
import 'my_page_view_model.dart';

class ProfileEditModel {
  ProfileUpdateFormDTO profileUpdateFormDTO;

  ProfileEditModel(this.profileUpdateFormDTO);
}

class ProfileEditViewModel extends StateNotifier<ProfileEditModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ProfileEditViewModel(super._state, this.ref);

  Future<void> updateProfile(UserUpdateDTO updateDTO) async {

    ResponseDTO responseDTO = await UserRepository()
        .fetchUpdate(updateDTO);

    if (responseDTO.status == 200) {
      await ref
          .read(myPageProvider.notifier)
          .updatedUser(ProfileUpdateFormDTO.fromJson(responseDTO.body));

      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("프로필 수정 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyInit() async {

    ResponseDTO responseDTO =
        await UserRepository().profileUpdateForm();

    ProfileEditModel myPageModel =
        ProfileEditModel(ProfileUpdateFormDTO.fromJson(responseDTO.body));
    if (responseDTO.status == 200) {
      state = myPageModel;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("프로필 수정 정보 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final profileEditProvider =
    StateNotifierProvider<ProfileEditViewModel, ProfileEditModel?>(
  (ref) {
    return ProfileEditViewModel(null, ref)..notifyInit();
  },
);
