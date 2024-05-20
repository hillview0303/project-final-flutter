import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/activity_repository.dart';
import 'package:project_app/ui/main/activity/viewmodel/drink_water_viewmodel.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../main.dart';

class WalkingDetailModel{
  WalkingDetailDTO walkingDetailDTO ;
  List<WeekWalkingDTO> weekWalkings ;

  WalkingDetailModel(this.walkingDetailDTO, this.weekWalkings);

}

class WalkingDetailViewModel extends StateNotifier<WalkingDetailModel?>{
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  WalkingDetailViewModel(super.state, this.ref);


  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ActivityRepository().fetchWalkingDetail();

    if(responseDTO.status == 200){
      state = responseDTO.body;
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> sendStepsToServer(int steps) async {
     await ActivityRepository().fetchSendWalking(steps);

  }




}
final WalkingDetailProvider = StateNotifierProvider<WalkingDetailViewModel,WalkingDetailModel?>((ref) {
  return WalkingDetailViewModel(null, ref)..notifyInit();
},);
