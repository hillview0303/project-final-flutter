class UpdateBodyDataRequestDTO {
  final double fat;
  final double muscle;
  final double weight;

  UpdateBodyDataRequestDTO(this.fat, this.muscle, this.weight);

  Map<String, dynamic> toJson() =>
      {"fat": fat, "muscle": muscle, "weight": weight};
}

class AddGoalDataRequestDTO{

  final double? goalFat;
  final double? goalMuscle;
  final double? goalWeight;

  AddGoalDataRequestDTO({this.goalFat, this.goalMuscle, this.goalWeight});

  Map<String, dynamic> toJson() =>
      {"goalFat": goalFat, "goalMuscle": goalMuscle, "goalWeight": goalWeight};
}