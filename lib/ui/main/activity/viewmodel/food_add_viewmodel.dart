import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/activity_repository.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../../../../main.dart';

class FoodAddModel {
  String selectedMealType;
  String? selectedDate;
  String? selectedImg;
  List<FoodContentListDTO> foodContentList;
  List<FoodContentListDTO> selectedFoods;
  List<int> selectedServings; // 각 음식의 인분 수를 나타내는 리스트 추가

  FoodAddModel({
    this.selectedMealType = "아침",
    this.selectedDate,
    this.selectedImg,
    required this.foodContentList,
    this.selectedFoods = const [],
    this.selectedServings = const [], // 초기값 설정
  });

  FoodAddModel copyWith({
    String? selectedDate,
    String? selectedImg,
    String? selectedMealType,
    List<FoodContentListDTO>? foodContentList,
    List<FoodContentListDTO>? selectedFoods,
    List<int>? selectedServings, // 인분 수 추가
  }) {
    return FoodAddModel(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedImg: selectedImg ?? this.selectedImg,
      selectedMealType: selectedMealType ?? this.selectedMealType,
      foodContentList: foodContentList ?? this.foodContentList,
      selectedFoods: selectedFoods ?? this.selectedFoods,
      selectedServings: selectedServings ?? this.selectedServings, // 인분 수 복사
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

  void selectFood(FoodContentListDTO food, int portion) {
    final updatedSelectedFoods = List<FoodContentListDTO>.from(state!.selectedFoods)..add(food);
    final updatedServings = List<int>.from(state!.selectedServings)..add(portion); // 인분 수 추가
    state = state!.copyWith(selectedFoods: updatedSelectedFoods, selectedServings: updatedServings);
  }

  Future<void> notifyInit({String? keyword}) async {
    ResponseDTO responseDTO = await ActivityRepository().fetchFoodList(keyword: keyword);
    List<FoodContentListDTO> foodContentListDTO = responseDTO.body;

    state = FoodAddModel(foodContentList: foodContentListDTO);
  }
}

final foodAddProvider = StateNotifierProvider<FoodAddViewModel, FoodAddModel?>((ref) {
  return FoodAddViewModel(null, ref)..notifyInit();
});
