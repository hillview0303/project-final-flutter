class UpdateBodyDataRequestDTO {
  final double fat;
  final double muscle;
  final double weight;

  UpdateBodyDataRequestDTO(this.fat, this.muscle, this.weight);

  Map<String, dynamic> toJson() =>
      {"fat": fat, "muscle": muscle, "weight": weight};
}
