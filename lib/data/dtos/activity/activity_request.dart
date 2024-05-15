class StepDTO {
  int walking;

  StepDTO(this.walking);

  Map<String, dynamic> toJson() {
    return {"walking": this.walking};
  }
}
