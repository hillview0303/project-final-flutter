import 'package:intl/intl.dart';

class ChangeBodyDataDTO {
  int id;
  double fat;
  double muscle;
  double weight;
  double goalFat;
  double goalMuscle;
  double goalWeight;

  ChangeBodyDataDTO(this.id, this.fat, this.muscle, this.weight, this.goalFat,
      this.goalMuscle, this.goalWeight);

  ChangeBodyDataDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        goalWeight = json["goalWeight"].toDouble(),
        goalMuscle = json["goalMuscle"].toDouble(),
        goalFat = json["goalFat"].toDouble();
}

class FatTimeLineDTO{
  int id ;
  double fat ;
  DateTime fatTimeLine;

  FatTimeLineDTO(this.id, this.fat, this.fatTimeLine);
  FatTimeLineDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        fat = json["fat"].toDouble(),
        fatTimeLine = DateFormat("yyyy-MM-dd")
            .parse(json["fatTimeLine"], true)
            .toLocal();

}

class MuscleTimeLineDTO{
  int id ;
  double muscle ;
  DateTime muscleTimeLine;

  MuscleTimeLineDTO(this.id, this.muscle, this.muscleTimeLine);
  MuscleTimeLineDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        muscle = json["muscle"].toDouble(),
        muscleTimeLine = DateFormat("yyyy-MM-dd")
            .parse(json["muscleTimeLine"], true)
            .toLocal();
}

class WeightTimeLineDTO{
  int id ;
  double weight ;
  DateTime weightTimeLine;

  WeightTimeLineDTO(this.id, this.weight, this.weightTimeLine);
  WeightTimeLineDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        weight = json["weight"].toDouble(),
        weightTimeLine = DateFormat("yyyy-MM-dd")
            .parse(json["weightTimeLine"], true)
            .toLocal();
}
