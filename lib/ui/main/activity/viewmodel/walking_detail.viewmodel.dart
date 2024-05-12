import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/activity_repository.dart';
import 'package:project_app/ui/main/activity/viewmodel/drink_water_viewmoddel..dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../main.dart';

class WaterDetailModel{
  WalkingDetailDTO walkingDetailDTO ;
  List<WeakWalkingDTO> weakWalkings ;

  WaterDetailModel(this.walkingDetailDTO, this.weakWalkings);

}

class WaterDetailViewModel extends StateNotifier<DrinkWaterModel?>{
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  WaterDetailViewModel(super.state, this.ref);


  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ActivityRepository().fetchWalkingDetail();

    if(responseDTO.status == 200){
      state = responseDTO.body;
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

}