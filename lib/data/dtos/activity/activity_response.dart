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
        fatTimeLine =
            DateFormat("yyyy-MM-dd").parse(json["fatTimeLine"], true).toLocal();
}

class MuscleTimeLineDTO {
  final int bodyDateId;
  final double muscle;
  final DateTime muscleTimeLine;

  MuscleTimeLineDTO(this.bodyDateId, this.muscle, this.muscleTimeLine);

  MuscleTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        muscle = json["muscle"].toDouble(),
        muscleTimeLine = DateFormat("yyyy-MM-dd")
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
        weightTimeLine = DateFormat("yyyy-MM-dd")
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
      : createdAt =
            DateFormat("yyyy-MM-dd").parse(json["createdAt"], true).toLocal(),
        walking = json["walking"],
        drinkWater = json["drinkWater"],
        kcal = json["kcal"],
        weight = json["weight"].toDouble();
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
      : date = DateFormat("yyyy-MM-dd").parse(json["date"], true).toLocal(),
        water = json["water"];
}
