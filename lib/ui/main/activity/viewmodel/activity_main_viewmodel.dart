import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../data/repository/activity_repository.dart';
import '../../../../main.dart';

class ActivityMainModel{
  ActivitiesDateDTO activitiesDateDTO ;

  ActivityMainModel(this.activitiesDateDTO);
}

class ActivityMainViewModel extends StateNotifier<ActivityMainModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ActivityMainViewModel(super.state, this.ref);

  Future<void> notifyInit(DateTime selectedDate) async {

    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    ResponseDTO responseDTO =
    await ActivityRepository().fetchActivityMain(formattedDate);

    if(responseDTO.status == 200){

      state = responseDTO.body;

    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.msg}")));
    }
  }

}

final ActivityMainProvider = StateNotifierProvider<ActivityMainViewModel,ActivityMainModel?>((ref) {
  return ActivityMainViewModel(null, ref);
},);
