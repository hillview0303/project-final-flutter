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
        fatTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm").parse(json["fatTimeLine"], true).toUtc().add(Duration(hours: 9));

  // 날짜 포맷 메서드
  String get formattedDate => DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(fatTimeLine);
}

class MuscleTimeLineDTO {
  final int bodyDateId;
  final double muscle;
  final DateTime muscleTimeLine;

  MuscleTimeLineDTO(this.bodyDateId, this.muscle, this.muscleTimeLine);

  MuscleTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        muscle = json["muscle"].toDouble(),
        muscleTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm").parse(json["muscleTimeLine"], true).toUtc().add(Duration(hours: 9));

  // 날짜 포맷 메서드
  String get formattedDate => DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(muscleTimeLine);
}

class WeightTimeLineDTO {
  int bodyDateId;
  double weight;
  DateTime weightTimeLine;

  WeightTimeLineDTO(this.bodyDateId, this.weight, this.weightTimeLine);

  WeightTimeLineDTO.fromJson(Map<String, dynamic> json)
      : bodyDateId = json["bodyDateId"],
        weight = json["weight"].toDouble(),
        weightTimeLine = DateFormat("yyyy-MM-dd'T'HH:mm").parse(json["weightTimeLine"], true).toUtc().add(Duration(hours: 9));

  // 날짜 포맷 메서드
  String get formattedDate => DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(weightTimeLine);
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
      : createdAt = DateFormat("yyyy-MM-dd'T'HH:mm").parse(json["createdAt"], true).toUtc().add(Duration(hours: 9)),
        walking = json["walking"],
        drinkWater = json["drinkWater"],
        kcal = json["kcal"],
        weight = json["weight"]?.toDouble();

  // 날짜 포맷 메서드
  String get formattedDate => DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(createdAt);
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
      : date = DateFormat("yyyy-MM-dd'T'HH:mm").parse(json["date"], true).toUtc().add(Duration(hours: 9)),
        water = json["water"];

  // 날짜 포맷 메서드
  String get formattedDate => DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(date);
}

class WalkingDetailDTO{
  final int? dayWalking ;
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
        this.maxWalkingDay
      });

  WalkingDetailDTO.fromJson(Map<String, dynamic> json)
      : dayWalking = json["dayWalking"],
        totalMonthWalking = json["totalMonthWalking"],
        avgMonthWalking = json["avgMonthWalking"].toDouble(),
        rateAvgWalking = json["rateAvgWalking"].toDouble(),
        maxWalking = json["maxWalking"],
        maxWalkingDay = DateFormat("yyyy-MM-dd").parse(json["maxWalkingDay"], true).toLocal();
}

class WeakWalkingDTO {
  final DateTime date ;
  final int walking ;

  WeakWalkingDTO(this.date, this.walking);

  WeakWalkingDTO.fromJson(Map<String, dynamic> json)
      : date = DateFormat("yyyy-MM-dd").parse(json["date"], true).toLocal(),
        walking = json["walking"];
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
      carbo: json["carbo"],
      protein: json["protein"],
      fat: json["fat"],
      kcal: json["kcal"],
      gram: json["gram"],
    );
  }
// 먹은 그램양
}
