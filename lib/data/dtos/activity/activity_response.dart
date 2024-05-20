import 'package:intl/intl.dart';

class ChangeBodyDataDTO {
  final int userId;
  final double fat;
  final double muscle;
  final double weight;
  final double goalFat;
  final double goalMuscle;
  final double goalWeight;

  ChangeBodyDataDTO(this.userId, this.fat, this.muscle, this.weight,
      this.goalFat, this.goalMuscle, this.goalWeight);

  ChangeBodyDataDTO.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        goalWeight = json["goalWeight"].toDouble(),
        goalMuscle = json["goalMuscle"].toDouble(),
        goalFat = json["goalFat"].toDouble();
}

class FatTimeLineDTO {
  final int bodyDateId;
  final double fat;
  final DateTime fatTimeLine;

  FatTimeLineDTO(this.bodyDateId, this.fat, this.fatTimeLine);

  FatTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        fat = json["fat"].toDouble(),
        fatTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm")
            .parse(json["fatTimeLine"], true)
            .toUtc()
            .add(Duration(hours: 9));

  // 날짜 포맷 메서드
  String get formattedDate =>
      DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(fatTimeLine);
}

class MuscleTimeLineDTO {
  final int bodyDateId;
  final double muscle;
  final DateTime muscleTimeLine;

  MuscleTimeLineDTO(this.bodyDateId, this.muscle, this.muscleTimeLine);

  MuscleTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        muscle = json["muscle"].toDouble(),
        muscleTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm")
            .parse(json["muscleTimeLine"], true)
            .toUtc()
            .add(Duration(hours: 9));

  // 날짜 포맷 메서드
  String get formattedDate =>
      DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(muscleTimeLine);
}

class WeightTimeLineDTO {
  int bodyDateId;
  double weight;
  DateTime weightTimeLine;

  WeightTimeLineDTO(this.bodyDateId, this.weight, this.weightTimeLine);

  WeightTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        weight = json["weight"].toDouble(),
        weightTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm")
            .parse(json["weightTimeLine"], true)
            .toUtc()
            .add(Duration(hours: 9));

  // 날짜 포맷 메서드
  String get formattedDate =>
      DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(weightTimeLine);
}

class ActivitiesDateDTO {
  final DateTime createdAt;
  final int? walking;
  final int? drinkWater;
  final int? kcal;
  final double? weight;

  ActivitiesDateDTO(
      {required this.createdAt,
      this.walking,
      this.drinkWater,
      this.kcal,
      this.weight});

  ActivitiesDateDTO.fromJson(Map<String, dynamic> json)
      : createdAt = DateFormat("yyyy-MM-dd'T'HH:mm")
            .parse(json["createdAt"], true)
            .toUtc()
            .add(Duration(hours: 9)),
        walking = json["walking"],
        drinkWater = json["drinkWater"],
        kcal = json["kcal"],
        weight = json["weight"]?.toDouble();

  // 날짜 포맷 메서드
  String get formattedDate =>
      DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(createdAt);
}

class DrinkWaterDTO {
  final int dayWater;

  DrinkWaterDTO(this.dayWater);

  DrinkWaterDTO.fromJson(Map<String, dynamic> json)
      : dayWater = json["dayWater"];
}

class WeekWaterDTO {
  final DateTime date;
  final int water;

  WeekWaterDTO(this.date, this.water);

  WeekWaterDTO.fromJson(Map<String, dynamic> json)
      : date = DateFormat("yyyy-MM-dd'T'HH:mm")
            .parse(json["date"], true)
            .toUtc()
            .add(Duration(hours: 9)),
        water = json["water"];

  // 날짜 포맷 메서드
  String get formattedDate => DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(date);
}

class WalkingDetailDTO {
  final int? dayWalking;

  final int? totalMonthWalking;
  final double? avgMonthWalking;
  final double? rateAvgWalking;
  final int? maxWalking;
  final DateTime? maxWalkingDay;

  WalkingDetailDTO(
      {this.dayWalking,
      this.totalMonthWalking,
      this.avgMonthWalking,
      this.rateAvgWalking,
      this.maxWalking,
      this.maxWalkingDay});

  WalkingDetailDTO.fromJson(Map<String, dynamic> json)
      : dayWalking = json["dayWalking"],
        totalMonthWalking = json["totalMonthWalking"],
        avgMonthWalking = json["avgMonthWalking"].toDouble(),
        rateAvgWalking = json["rateAvgWalking"].toDouble(),
        maxWalking = json["maxWalking"],
        maxWalkingDay = DateFormat("yyyy-MM-dd")
            .parse(json["maxWalkingDay"], true)
            .toLocal();
}

class WeekWalkingDTO {
  final DateTime date;

  final int walking;

  WeekWalkingDTO(this.date, this.walking);

  WeekWalkingDTO.fromJson(Map<String, dynamic> json)
      : date = DateFormat("yyyy-MM-dd").parse(json["date"], true).toLocal(),
        walking = json["walking"];
}

// 식단페이지
class MealMainDTO {
  double? recommendCal; // 권장 칼로리
  double? recommendCarbon; // 권장 탄수화물
  double? recommendFat; // 권장 지방
  double? recommendProtein; // 권장 단백질

  List<MealListDTO>? mealList;

  MealMainDTO(
      {this.recommendCal,
      this.recommendCarbon,
      this.recommendFat,
      this.recommendProtein,
      this.mealList}); // 추가된 음식 리스트

  factory MealMainDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevMealList = json["mealList"];
    List<MealListDTO> newMealList =
        prevMealList.map((e) => MealListDTO.fromJson(e)).toList();

    return MealMainDTO(
      recommendCal: json["recommendCal"],
      recommendCarbon: json["recommendCarbon"],
      recommendFat: json["recommendFat"],
      recommendProtein: json["recommendProtein"],
      mealList: newMealList,
    );
  }
//
//
}

class MealListDTO {
  final int? mealId;
  final String? mealImg;
  final String? eatTime;
  final List<FoodsDTO>? foods;

  MealListDTO({this.mealId, this.mealImg, this.eatTime, this.foods});

  factory MealListDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevFoods = json["foods"];
    List<FoodsDTO> newFoods =
        prevFoods.map((food) => FoodsDTO.fromJson(food)).toList();

    return MealListDTO(
      mealId: json["mealId"],
      mealImg: json["mealImg"],
      eatTime: json["eatTime"],
      foods: newFoods,
    );
  }

  MealListDTO copyWith({
    int? mealId,
    String? mealImg,
    String? eatTime,
    List<FoodsDTO>? foods,
  }) {
    return MealListDTO(
      mealId: mealId ?? this.mealId,
      mealImg: mealImg ?? this.mealImg,
      eatTime: eatTime ?? this.eatTime,
      foods: foods ?? this.foods,
    );
  }
//
}

class FoodsDTO {
  final int? foodId;
  final String? foodName;
  final double? carbo;
  final double? protein;
  final double? fat;
  final double? kcal;
  final int? gram;

  FoodsDTO(
      {this.foodId,
      this.foodName,
      this.carbo,
      this.protein,
      this.fat,
      this.kcal,
      this.gram});

  factory FoodsDTO.fromJson(Map<String, dynamic> json) {
    return FoodsDTO(
      foodId: json["foodId"],
      foodName: json["foodName"],
      carbo: json["carbo"],
      protein: json["protein"],
      fat: json["fat"],
      kcal: json["kcal"],
      gram: json["gram"],
    );
  }

  FoodsDTO copyWith({
    int? foodId,
    String? foodName,
    double? carbo,
    double? protein,
    double? fat,
    double? kcal,
    int? gram,
  }) {
    return FoodsDTO(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      carbo: carbo ?? this.carbo,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      kcal: kcal ?? this.kcal,
      gram: gram ?? this.gram,
    );
  }
//
}

class FoodContentListDTO {
  final int id;
  final String name;
  final double carbo; // 탄수화물
  final double protein; // 단백질
  final double fat; // 지방
  final double kcal; // 칼로리
  final int gram;

  FoodContentListDTO(
      {required this.id,
      required this.name,
      required this.carbo,
      required this.protein,
      required this.fat,
      required this.kcal,
      required this.gram});

  factory FoodContentListDTO.fromJson(Map<String, dynamic> json) {
    return FoodContentListDTO(
      id: json["id"],
      name: json["name"],
      carbo: json["carbo"],
      protein: json["protein"],
      fat: json["fat"],
      kcal: json["kcal"],
      gram: json["gram"],
    );
  }
// 먹은 그램양
}

class MealSaveResponseDTO {
  int mealId;
  String? mealImg;
  List<EatDTO> foods;

  MealSaveResponseDTO(
      {required this.mealId, this.mealImg, required this.foods});

  factory MealSaveResponseDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevEatDTOList = json["foods"];
    List<EatDTO> eatDTOList =
        prevEatDTOList.map((eat) => EatDTO.fromJson(eat)).toList();

    return MealSaveResponseDTO(
        mealId: json["mealId"], mealImg: json["mealImg"], foods: eatDTOList);
  }
//
}

class EatDTO {
  int foodId;
  int foodQuantity;

  EatDTO({required this.foodId, required this.foodQuantity});

  factory EatDTO.fromJson(Map<String, dynamic> json) {
    return EatDTO(
      foodId: json["foodId"],
      foodQuantity: json["foodQuantity"],
    );
  }
//
}
