import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/challenge/challenge_response.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/challenge_respository.dart';
import 'package:project_app/main.dart';

class ChallengeListModel {
  AttendChallenge? attendChallenge;
  List<ChallengeListDTO>? upcomingChallengeDTOList;
  List<ChallengeListDTO>? pastChallengesDTOList;

  ChallengeListModel(
      {this.attendChallenge,
      this.upcomingChallengeDTOList,
      this.pastChallengesDTOList});

  ChallengeListModel copyWith({
    AttendChallenge? attendChallenge,
    List<ChallengeListDTO>? upcomingChallengeDTOList,
    List<ChallengeListDTO>? pastChallengesDTOList,
  }) {
    return ChallengeListModel(
      attendChallenge: attendChallenge ?? this.attendChallenge,
      upcomingChallengeDTOList:
          upcomingChallengeDTOList ?? this.upcomingChallengeDTOList,
      pastChallengesDTOList:
          pastChallengesDTOList ?? this.pastChallengesDTOList,
    );
  }
}

class ChallengeListViewModel extends StateNotifier<ChallengeListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ChallengeListViewModel(super._state, this.ref);

  // 통신 없이 챌린지 시작
  void startChallenge(AttendChallenge attendChallenge) {
    List<ChallengeListDTO> upcomingChallenge = state!.upcomingChallengeDTOList!
      ..removeWhere((challenge) => challenge.id == attendChallenge.id);

    state = state!.copyWith(
        attendChallenge: attendChallenge,
        upcomingChallengeDTOList: upcomingChallenge);
  }

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ChallengeRepository().getChallengeList();

    ChallengeResponseDTO challengeResponseDTO = responseDTO.body;

    if (responseDTO.status == 200) {
      AttendChallenge? challenge;

      if (challengeResponseDTO.id != null) {
        challenge = AttendChallenge(
            id: challengeResponseDTO.id,
            challengeName: challengeResponseDTO.challengeName,
            subtitle: challengeResponseDTO.subtitle,
            closingTime: challengeResponseDTO.closingTime,
            coin: challengeResponseDTO.coin,
            walking: challengeResponseDTO.walking,
            totalWalking: challengeResponseDTO.totalWalking,
            backImg: challengeResponseDTO.backImg);
      }

      ChallengeListModel challengeListModel = ChallengeListModel().copyWith(
          attendChallenge: challenge,
          upcomingChallengeDTOList: challengeResponseDTO.upcomingChallenges,
          pastChallengesDTOList: challengeResponseDTO.pastchallenges);
      state = challengeListModel;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("챌린지 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final challengeListProvider =
    StateNotifierProvider<ChallengeListViewModel, ChallengeListModel?>((ref) {
  return ChallengeListViewModel(null, ref)..notifyInit();
});
