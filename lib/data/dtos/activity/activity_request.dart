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

class SaveMealDTO {
  final String eatTime;
  final String? mealImg;
  final List<Food> foods;

  SaveMealDTO({required this.eatTime, this.mealImg, required this.foods});

  Map<String, dynamic> toJson() {
    return {
      "eatTime": this.eatTime,
      "mealImg": this.mealImg,
      "foods": this.foods.map((food) => food.toJson()).toList(),
    };
  }
}

class Food {
  final int foodId;
  final int qty;

  Food(this.foodId, this.qty);

  Map<String, dynamic> toJson() {
    return {
      "foodId": this.foodId,
      "qty": this.qty,
    };
  }
}
