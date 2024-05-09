import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../data/repository/activity_repository.dart';
import '../../../../data/store/session_store.dart';
import '../../../../main.dart';

class ChangeWeightModel {
  ChangeBodyDataDTO? changeBodyData;
  List<FatTimeLineDTO>? fatTimeLineDTO;
  List<MuscleTimeLineDTO>? muscleTimeLineDTO;
  List<WeightTimeLineDTO>? weightTimeLineDTO;

  ChangeWeightModel(this.changeBodyData, this.fatTimeLineDTO,
      this.muscleTimeLineDTO, this.weightTimeLineDTO);
}

class ChangeWeightViewModel extends StateNotifier<ChangeWeightModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ChangeWeightViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
        await ActivityRepository().fetchChangeWeight();
  }
}
