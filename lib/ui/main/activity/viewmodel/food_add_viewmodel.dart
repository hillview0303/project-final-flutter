import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/activity_repository.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../main.dart';

class FoodAddModel {
  String selectedMealType; // 아침, 점심, 저녁 여부
  String? selectedDate;
  String? selectedImg;
  List<FoodContentListDTO> foodContentList;
  FoodContentListDTO? selectedFood;

  FoodAddModel({
    this.selectedMealType = "아침",
    this.selectedDate,
    this.selectedImg,
    required this.foodContentList,
    this.selectedFood,
  });

  FoodAddModel copyWith({
    String? selectedDate,
    String? selectedImg,
    String? selectedMealType,
    List<FoodContentListDTO>? foodContentList,
    FoodContentListDTO? selectedFood,
  }) {
    return FoodAddModel(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedImg: selectedImg ?? this.selectedImg,
      selectedMealType: selectedMealType ?? this.selectedMealType,
      foodContentList: foodContentList ?? this.foodContentList,
      selectedFood: selectedFood ?? this.selectedFood,
    );
  }
}
class FoodAddViewModel extends StateNotifier<FoodAddModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  FoodAddViewModel(super._state, this.ref);

  void selectMealType(String mealType) {
    state = state!.copyWith(selectedMealType: mealType);
  }

  void selectImg(String img) {
    state = state!.copyWith(selectedImg: img);
  }

  void selectDate(String date) {
    state = state!.copyWith(selectedDate: date);
  }

  void selectFood(FoodContentListDTO food) {
    state = state!.copyWith(selectedFood: food);
  }

  Future<void> notifyInit({String? keyword}) async {
    ResponseDTO responseDTO =
    await ActivityRepository().fetchFoodList(keyword: keyword);
    List<FoodContentListDTO> foodContentListDTO = responseDTO.body;

    state = FoodAddModel(foodContentList: foodContentListDTO);
  }
}

final foodAddProvider =
StateNotifierProvider<FoodAddViewModel, FoodAddModel?>((ref) {
  return FoodAddViewModel(null, ref)..notifyInit();
});