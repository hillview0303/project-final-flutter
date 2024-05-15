import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/activity_repository.dart';
import 'package:project_app/ui/main/activity/viewmodel/drink_water_viewmoddel..dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../main.dart';

class WalkingDetailModel{
  WalkingDetailDTO walkingDetailDTO ;
  List<WeakWalkingDTO> weakWalkings ;

  WalkingDetailModel(this.walkingDetailDTO, this.weakWalkings);

}

class WalkingDetailViewModel extends StateNotifier<WalkingDetailModel?>{
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  WalkingDetailViewModel(super.state, this.ref);


  Future<void> notifyInit() async {
    print("!1111111111");
    ResponseDTO responseDTO = await ActivityRepository().fetchWalkingDetail();
    print("22222222");

    if(responseDTO.status == 200){
      print("3333333");
      state = responseDTO.body;
      print("444444444");
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> sendStepsToServer(int steps) async {
    ResponseDTO responseDTO = await ActivityRepository().fetchSendWalking(steps);

    if(responseDTO.status == 200){

      state = responseDTO.body;
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }

  }




}
final WalkingDetailProvider = StateNotifierProvider<WalkingDetailViewModel,WalkingDetailModel?>((ref) {
  return WalkingDetailViewModel(null, ref)..notifyInit();
},);
