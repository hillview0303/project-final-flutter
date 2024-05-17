import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/repository/challenge_respository.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../main.dart';

class OngoingChallengeModel {

}

class OngoingChallengeViewModel extends StateNotifier<OngoingChallengeModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  OngoingChallengeViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ChallengeRepository().fetchOngoingPage();

    if (responseDTO.status == 200) {
      state = responseDTO.body;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

}

final OngoingChallengeProvider =
StateNotifierProvider<OngoingChallengeViewModel, OngoingChallengeModel?>(
      (ref) {
    return OngoingChallengeViewModel(null, ref)..notifyInit();
  },
);

