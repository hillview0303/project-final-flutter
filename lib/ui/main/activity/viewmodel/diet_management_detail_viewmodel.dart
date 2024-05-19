import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';
import 'package:project_app/data/dtos/response_dto.dart';
import 'package:project_app/data/repository/activity_repository.dart';

import '../../../../main.dart';

class DietManageMentDetailModel {
  final double? totalCalories;
  final double? totalCarbo;
  final double? totalProtein;
  final double? totalFat;
  final DateTime? selectedDateTime;
  final MealMainDTO? mealMainDTO;

  DietManageMentDetailModel(
      {this.totalCalories,
      this.totalCarbo,
      this.totalProtein,
      this.totalFat,
      this.selectedDateTime,
      this.mealMainDTO});

  DietManageMentDetailModel copyWith({
    double? totalCalories,
    double? totalCarbo,
    double? totalProtein,
    double? totalFat,
    DateTime? selectedDateTime,
    MealMainDTO? mealMainDTO,
  }) {
    return DietManageMentDetailModel(
        totalCalories: totalCalories ?? this.totalCalories,
        totalCarbo: totalCarbo ?? this.totalCarbo,
        totalProtein: totalProtein ?? this.totalProtein,
        totalFat: totalFat ?? this.totalFat,
        mealMainDTO: mealMainDTO ?? this.mealMainDTO,
        selectedDateTime: selectedDateTime ?? this.selectedDateTime);
  }
}

class DietManagementDetailViewModel
    extends StateNotifier<DietManageMentDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  DietManagementDetailViewModel(super.state, this.ref);

  void addMeal(
      List<FoodsDTO> foodsDTO, String mealType, int mealId, String? mealImg) {
    MealListDTO mealListDTO = MealListDTO(
        foods: foodsDTO, mealImg: mealImg, eatTime: mealType, mealId: mealId);

    List<MealListDTO> newMealListDTO = state!.mealMainDTO!.mealList!
      ..add(mealListDTO);

    state = state!.copyWith(
        mealMainDTO: MealMainDTO(
            recommendCarbon: state!.mealMainDTO!.recommendCarbon,
            recommendProtein: state!.mealMainDTO!.recommendProtein,
            recommendFat: state!.mealMainDTO!.recommendFat,
            recommendCal: state!.mealMainDTO!.recommendCal,
            mealList: newMealListDTO));
  }

  Future<void> deleteMeal(int mealId) async {
    ResponseDTO responseDTO = await ActivityRepository()
        .fetchDeleteMeal(state!.selectedDateTime!, mealId);
    if (responseDTO.status == 200) {
      List<MealListDTO> mealListDTO = state!.mealMainDTO!.mealList!
        ..removeWhere((meal) => meal.mealId == mealId);

      MealMainDTO mealMainDTO = MealMainDTO(
        mealList: mealListDTO,
        recommendCal: state!.mealMainDTO!.recommendCal,
        recommendCarbon: state!.mealMainDTO!.recommendCarbon,
        recommendFat: state!.mealMainDTO!.recommendFat,
        recommendProtein: state!.mealMainDTO!.recommendProtein,
      );

      state = state!.copyWith(mealMainDTO: mealMainDTO);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("식단 삭제 실패 : ${responseDTO.msg}")));
    }
  }

  Future<void> notifyInit(DateTime selectedDate) async {
    ResponseDTO responseDTO =
        await ActivityRepository().fetchMealListByDate(selectedDate);

    MealMainDTO mainDTO = responseDTO.body;

    if (responseDTO.status == 200) {
      List<FoodsDTO>? foodList =
          mainDTO.mealList?.expand((meal) => meal.foods!).toList();
      double? totalCalories;
      double? totalCarbo;
      double? totalFat;
      double? totalProtein;

      if (mainDTO.mealList!.isNotEmpty) {
        totalCalories = foodList!.fold(0.0, (sum, food) => sum! + food.kcal!);
        totalCarbo = foodList!.fold(0.0, (sum, food) => sum! + food.carbo!);
        totalFat = foodList!.fold(0.0, (sum, food) => sum! + food.fat!);
        totalProtein = foodList!.fold(0.0, (sum, food) => sum! + food.protein!);

        print(
            "total : ${totalCalories}, ${totalCarbo}, ${totalFat}, ${totalProtein}");
      }

      state = DietManageMentDetailModel(
          selectedDateTime: selectedDate,
          mealMainDTO: mainDTO,
          totalCalories: totalCalories,
          totalCarbo: totalCarbo,
          totalFat: totalFat,
          totalProtein: totalProtein);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("식단 불러오기 실패 : ${responseDTO.msg}")));
    }
  }
}

final dietManagementDetailProvider = StateNotifierProvider<
    DietManagementDetailViewModel, DietManageMentDetailModel?>(
  (ref) {
    return DietManagementDetailViewModel(null, ref)..notifyInit(DateTime.now());
  },
);
