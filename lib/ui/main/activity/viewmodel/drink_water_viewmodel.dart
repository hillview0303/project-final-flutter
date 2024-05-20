import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../data/dtos/response_dto.dart';
import '../../../../data/repository/activity_repository.dart';
import '../../../../main.dart';

class DrinkWaterModel{
  DrinkWaterDTO drinkWaterDTO ;
  List<WeekWaterDTO> weekWaterDTO;

  DrinkWaterModel(this.drinkWaterDTO, this.weekWaterDTO);
}


class DrinkWaterViewModel extends StateNotifier<DrinkWaterModel?>{
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  DrinkWaterViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
    await ActivityRepository().fetchDrinkWater();


    if(responseDTO.status == 200){
      state = responseDTO.body;
      print("state : ${state?.weekWaterDTO.last.water}");
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> updateWater(int drinkWater) async {
    await ActivityRepository().fetchUpdateWater(drinkWater);

  }

}

final DrinkWaterProvider = StateNotifierProvider<DrinkWaterViewModel,DrinkWaterModel?>((ref) {
  return DrinkWaterViewModel(null, ref)..notifyInit();
},);
