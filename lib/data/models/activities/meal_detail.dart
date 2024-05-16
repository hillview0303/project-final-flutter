import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetail {
  DateTime date;
  String mealType;
  String foodName;
  String gram;
  String imagePath;
  double calories;
  double targetCalories;
  double carbo;
  double protein;
  double fat;

  MealDetail({
    required this.date,
    required this.mealType,
    required this.foodName,
    required this.gram,
    required this.imagePath,
    required this.calories,
    required this.targetCalories,
    required this.carbo,
    required this.protein,
    required this.fat,
  });
}

// 초기 데이터
final List<MealDetail> initialMealList = [
  MealDetail(
    date: DateTime(2024, 5, 16),
    mealType: 'BREAKFAST',
    foodName: '고기와 야채',
    gram: '200g',
    imagePath: 'assets/images/meal1.png',
    calories: 1074,
    targetCalories: 1960,
    carbo: 20.00,
    protein: 13.50,
    fat: 25.40,
  ),
  MealDetail(
    date: DateTime(2024, 5, 16),
    mealType: 'LUNCH',
    foodName: '버거',
    gram: '500g',
    imagePath: 'assets/images/meal2.png',
    calories: 800,
    targetCalories: 1960,
    carbo: 40.00,
    protein: 25.00,
    fat: 30.00,
  ),
  MealDetail(
    date: DateTime(2024, 5, 16),
    mealType: 'DINNER',
    foodName: '콘스프',
    gram: '300g',
    imagePath: 'assets/images/meal3.png',
    calories: 600,
    targetCalories: 1960,
    carbo: 30.00,
    protein: 15.00,
    fat: 20.00,
  ),
  MealDetail(
    date: DateTime(2024, 5, 15),
    mealType: 'LUNCH',
    foodName: '비빔밥',
    gram: '350g',
    imagePath: 'assets/images/meal4.png',
    calories: 700,
    targetCalories: 1960,
    carbo: 35.00,
    protein: 20.00,
    fat: 15.00,
  ),
  MealDetail(
    date: DateTime(2024, 5, 15),
    mealType: 'DINNER',
    foodName: '비빔밥',
    gram: '350g',
    imagePath: 'assets/images/meal4.png',
    calories: 700,
    targetCalories: 1960,
    carbo: 35.00,
    protein: 20.00,
    fat: 15.00,
  ),
  MealDetail(
    date: DateTime(2024, 5, 15),
    mealType: 'SNACK',
    foodName: '비빔밥',
    gram: '350g',
    imagePath: 'assets/images/meal4.png',
    calories: 700,
    targetCalories: 1960,
    carbo: 35.00,
    protein: 20.00,
    fat: 15.00,
  ),
];

// StateNotifier를 사용하여 날짜 상태 관리
class DateNotifier extends StateNotifier<DateTime> {
  DateNotifier() : super(DateTime.now());

  void setDate(DateTime date) {
    state = date;
  }
}

// StateNotifier를 사용하여 식사 상태 관리
class MealNotifier extends StateNotifier<List<MealDetail>> {
  MealNotifier() : super(initialMealList);

  void deleteMeal(String mealType, DateTime date) {
    state = [
      for (final meal in state)
        if (meal.mealType != mealType || !isSameDate(meal.date, date)) meal,
    ];
  }
}

// Provider 정의
final dateProvider = StateNotifierProvider<DateNotifier, DateTime>((ref) {
  return DateNotifier();
});

final mealProvider = StateNotifierProvider<MealNotifier, List<MealDetail>>((ref) {
  return MealNotifier();
});

final mealsForSelectedDateProvider = Provider<List<MealDetail>>((ref) {
  final selectedDate = ref.watch(dateProvider);
  final meals = ref.watch(mealProvider);
  return meals.where((meal) => isSameDate(meal.date, selectedDate)).toList();
});

bool isSameDate(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}
