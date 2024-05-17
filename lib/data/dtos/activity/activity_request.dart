class StepDTO {
  int walking;

  StepDTO(this.walking);

  Map<String, dynamic> toJson() {
    return {"walking": this.walking};
  }
}

class WaterDTO {
  int water;

  WaterDTO(this.water);

  Map<String, dynamic> toJson() {
    return {"water": this.water};
  }
}
