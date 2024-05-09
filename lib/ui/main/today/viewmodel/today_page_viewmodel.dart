//창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/dtos/today/today_request.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/store/session_store.dart';
import 'package:project_app/main.dart';
import '../../../../data/dtos/today/today_response.dart';
import '../../../../data/dtos/user/user_response.dart';
import '../../../../data/repository/today_repository.dart';

class TodayPageModel {
  MainDTO mainDTO;
  List<BodyDataDTO> bodyData;
  AddBodyDTO? addBodyDTO;
  GoalFatDTO? goalFatDTO ;
  GoalMuscleDTO? goalMuscleDTO ;
  GoalWeightDTO? goalWeightDTO;

  TodayPageModel({required this.mainDTO,required this.bodyData,this.addBodyDTO,this.goalWeightDTO,this.goalMuscleDTO,this.goalFatDTO});
}

// 창고 창고

class TodayPageViewModel extends StateNotifier<TodayPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  TodayPageViewModel(super.state, this.ref);

  Future<void> notifyInit() async {

    ResponseDTO responseDTO =
    await TodayRepository().fetchMainPage();

    if (responseDTO.status == 200) {
      state = responseDTO.body;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddBodyData(AddBodyDataRequestDTO requestDTO) async {
    ResponseDTO responseDTO = await TodayRepository().fetchUpdateBodyData(requestDTO);


    if (responseDTO.status == 200) {
      AddBodyDTO addBodyDTO = AddBodyDTO.fromJson(responseDTO.body);
      TodayPageModel model = TodayPageModel(
          mainDTO: state!.mainDTO,
          bodyData: state!.bodyData,
          addBodyDTO: addBodyDTO);

      state = model;
      Navigator.pop(mContext!);

    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddFat(AddGoalFatRequestDTO requestDTO) async {
    ResponseDTO responseDTO = await TodayRepository().fetchAddGoalFat(requestDTO);

    if(responseDTO.status == 200){
      GoalFatDTO goalFatDTO = GoalFatDTO.fromJson(responseDTO.body);
      TodayPageModel model =TodayPageModel(goalFatDTO: goalFatDTO, mainDTO: state!.mainDTO, bodyData:state!.bodyData);
      state = model;
      Navigator.pop(mContext!);

    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddMuscle(AddGoalMuscleRequestDTO requestDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await TodayRepository()
        .fetchAddGoalMuscle(requestDTO);

    if(responseDTO.status == 200){
      GoalMuscleDTO goalMuscleDTO = GoalMuscleDTO.fromJson(responseDTO.body);
      TodayPageModel model =TodayPageModel(goalMuscleDTO: goalMuscleDTO, mainDTO: state!.mainDTO, bodyData:state!.bodyData);
      state = model;
      Navigator.pop(mContext!);

    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyAddWeight(AddGoalWeightRequestDTO requestDTO) async {
    ResponseDTO responseDTO = await TodayRepository().fetchAddGoalWeight(requestDTO);

    if(responseDTO.status == 200){
      GoalWeightDTO goalWeightDTO = GoalWeightDTO.fromJson(responseDTO.body);
      TodayPageModel model =TodayPageModel(goalWeightDTO: goalWeightDTO, mainDTO: state!.mainDTO, bodyData:state!.bodyData);
      state = model;
      Navigator.pop(mContext!);

    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

// 창고 관리자
final TodayPageProvider =
    StateNotifierProvider<TodayPageViewModel, TodayPageModel?>(
  (ref) {
    return TodayPageViewModel(null, ref)..notifyInit();
  },
);
