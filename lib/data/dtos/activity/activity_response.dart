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
        fatTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
            .parse(json["fatTimeLine"], true)
            .toLocal();
}

class MuscleTimeLineDTO {
  final int bodyDateId;
  final double muscle;
  final DateTime muscleTimeLine;

  MuscleTimeLineDTO(this.bodyDateId, this.muscle, this.muscleTimeLine);

  MuscleTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        muscle = json["muscle"].toDouble(),
        muscleTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
            .parse(json["muscleTimeLine"], true)
            .toLocal();
}

class WeightTimeLineDTO {
  int bodyDateId;

  double weight;

  DateTime weightTimeLine;

  WeightTimeLineDTO(this.bodyDateId, this.weight, this.weightTimeLine);

  WeightTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        weight = json["weight"].toDouble(),
        weightTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
            .parse(json["weightTimeLine"], true)
            .toLocal();
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
      : createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
      .parse(json["createdAt"], true)
      .toLocal(),
        walking = json["walking"],
        drinkWater = json["drinkWater"],
        kcal = json["kcal"],
        weight = json["weight"] != null ? json["weight"].toDouble() : null;
}

class DrinkWaterDTO {
  final int dayWater;

  DrinkWaterDTO(this.dayWater);

  DrinkWaterDTO.fromJson(Map<String, dynamic> json)
      : dayWater = json["dayWater"];
}

class WeakWaterDTO {
  final DateTime date;

  final int water;

  WeakWaterDTO(this.date, this.water);

  WeakWaterDTO.fromJson(Map<String, dynamic> json)
      : date = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
      .parse(json["date"], true)
      .toLocal(),
        water = json["water"];
}

class FoodContentListDTO {
  final int id;
  final String name;
  final double carbo; // 탄수화물
  final double protein; // 단백질
  final double fat; // 지방
  final int kcal; // 칼로리
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
      carbo: json["carbo"].toDouble(),
      protein: json["protein"].toDouble(),
      fat: json["fat"].toDouble(),
      kcal: json["kcal"],
      gram: json["gram"],
    );
  }
}
