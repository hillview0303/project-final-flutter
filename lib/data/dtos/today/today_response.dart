import 'package:intl/intl.dart';

class MainDTO {
  final int id;
  final String name;
  final double goalFat;
  final double goalMuscle;
  final double goalWeight;
  final double fat;
  final double muscle;
  final double weight;

  MainDTO(this.id, this.name, this.goalFat, this.goalMuscle, this.goalWeight,
      this.fat, this.muscle, this.weight);

  MainDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        goalWeight = json["goalWeight"].toDouble(),
        goalMuscle = json["goalMuscle"].toDouble(),
        goalFat = json["goalFat"].toDouble();
}

class BodyDataDTO {
  final int? id;
  final double? fat;
  final double? muscle;
  final double? weight;
  final DateTime? date;

  BodyDataDTO({this.id, this.fat, this.muscle, this.weight, this.date});

  BodyDataDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        date = DateFormat("yyyy-MM-dd").parse(json["date"], true).toLocal();
}

class AddBodyDTO {
  final double fat;
  final double muscle;
  final double weight;
  final DateTime date;

  AddBodyDTO(
      {required this.fat,
      required this.muscle,
      required this.weight,
      required this.date});

  factory AddBodyDTO.fromJson(Map<String, dynamic> json) {
    return AddBodyDTO(
      fat: json["fat"],
      muscle: json["muscle"],
      weight: json["weight"],
      date: DateFormat("yyyy-MM-dd").parse(json["date"], true).toLocal(),
    );
  }
//
}

class GoalFatDTO {
  final double goalFat;

  GoalFatDTO(this.goalFat);

  GoalFatDTO.fromJson(Map<String, dynamic> json)
      : goalFat = json["goalFat"].toDouble();
}

class GoalMuscleDTO {
  final double goalMuscle;

  GoalMuscleDTO(this.goalMuscle);

  GoalMuscleDTO.fromJson(Map<String, dynamic> json)
      : goalMuscle = json["goalMuscle"].toDouble();
}

class GoalWeightDTO {
  final double goalWeight;

  GoalWeightDTO(this.goalWeight);

  GoalWeightDTO.fromJson(Map<String, dynamic> json)
      : goalWeight = json["goalWeight"].toDouble();
}
