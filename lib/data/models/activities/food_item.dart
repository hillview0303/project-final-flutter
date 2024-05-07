class FoodItem {
  String title;
  String calories;
  String? imagePath;
  double carbs;
  double protein;
  double fats;

  FoodItem({
    required this.title,
    required this.calories,
    this.imagePath,
    required this.carbs,
    required this.protein,
    required this.fats,
  });
}

final Map<DateTime, List<FoodItem>> breakfast = {
  DateTime(2024, 5, 7): [
    FoodItem(
      title: '고기와 야채',
      calories: '250kcal',
      imagePath: 'assets/images/meal1.png',
      carbs: 0.6,
      protein: 0.2,
      fats: 0.2,
    ),
    FoodItem(
      title: '버거',
      calories: '250kcal',
      imagePath: 'assets/images/meal2.png',
      carbs: 0.6,
      protein: 0.2,
      fats: 0.2,
    ),
  ],
};
final Map<DateTime, List<FoodItem>> lunch = {
  DateTime(2024, 5, 7): [
    FoodItem(
      title: '오트밀',
      calories: '250kcal',
      imagePath: 'assets/images/meal3.png',
      carbs: 0.6,
      protein: 0.2,
      fats: 0.2,
    ),
    FoodItem(
      title: '과일 요거트',
      calories: '180kcal',
      imagePath: 'assets/images/meal4.png',
      carbs: 0.4,
      protein: 0.3,
      fats: 0.3,
    ),
  ],
};
final Map<DateTime, List<FoodItem>> dinner = {
  DateTime(2024, 5, 7): [
    FoodItem(
      title: '치킨 샐러드',
      calories: '350kcal',
      imagePath: 'assets/images/meal5.png',
      carbs: 0.1,
      protein: 0.5,
      fats: 0.4,
    ),
    FoodItem(
      title: '스테이크',
      calories: '500kcal',
      imagePath: 'assets/images/meal6.png',
      carbs: 0.05,
      protein: 0.7,
      fats: 0.25,
    ),
  ],
};
final Map<DateTime, List<FoodItem>> snack = {
  DateTime(2024, 5, 7): [
    FoodItem(
      title: '치킨 샐러드',
      calories: '350kcal',
      imagePath: 'assets/images/meal1.png',
      carbs: 0.1,
      protein: 0.5,
      fats: 0.4,
    ),
    FoodItem(
      title: '스테이크',
      calories: '500kcal',
      imagePath: 'assets/images/meal2.png',
      carbs: 0.05,
      protein: 0.7,
      fats: 0.25,
    ),
  ],
};
