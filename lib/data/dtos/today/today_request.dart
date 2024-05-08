class AddBodyDataRequestDTO {
  final double fat;
  final double muscle;
  final double weight;

  AddBodyDataRequestDTO(this.fat, this.muscle, this.weight);

  Map<String, dynamic> toJson() =>
      {"fat": fat, "muscle": muscle, "weight": weight};
}


class AddGoalFatRequestDTO {
  final double? goalFat;

  AddGoalFatRequestDTO(this.goalFat);

  Map<String, dynamic> toJson() => {"goalFat": goalFat};
}

class AddGoalMuscleRequestDTO {
  final double? goalMuscle;

  AddGoalMuscleRequestDTO(this.goalMuscle);

  Map<String, dynamic> toJson() => {"goalMuscle": goalMuscle};
}
class AddGoalWeightRequestDTO {
  final double? goalWeight;

  AddGoalWeightRequestDTO(this.goalWeight);

  Map<String, dynamic> toJson() => {"goalWeight": goalWeight};
}
