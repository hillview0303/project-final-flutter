import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:project_app/ui/main/activity/widgets/today_nutrition_info.dart';
import '../../../../_core/constants/size.dart';
import '../../../../data/models/activities/meal_detail.dart';
import '../widgets/custom_calendar_Agenda.dart';
import '../widgets/food_card.dart';

class DietManagementDetailPage extends ConsumerWidget {
  final CalendarAgendaController _controller = CalendarAgendaController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택된 날짜에 따른 식사 필터링
    final mealsForSelectedDate = ref.watch(mealsForSelectedDateProvider);

    // 오늘의 영양소 총합 계산
    final double totalCalories = mealsForSelectedDate.fold(0, (sum, meal) => sum + meal.calories);
    final double totalCarbo = mealsForSelectedDate.fold(0, (sum, meal) => sum + meal.carbo);
    final double totalProtein = mealsForSelectedDate.fold(0, (sum, meal) => sum + meal.protein);
    final double totalFat = mealsForSelectedDate.fold(0, (sum, meal) => sum + meal.fat);

    // 목표 값 설정
    final double targetCalories = 2000;
    final double targetCarbo = 300;
    final double targetProtein = 150;
    final double targetFat = 70;

    // 고정된 식사 카드
    final List<String> mealTypes = ['BREAKFAST', 'LUNCH', 'DINNER', 'SNACK'];

    return Scaffold(
      appBar: AppBar(
        title: Text('식단 관리', style: TextStyle(color: Colors.white)),
        backgroundColor: kAccentColor2,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: kAccentColor2,
      body: Column(
        children: <Widget>[
          CustomCalendarAgenda(
            controller: _controller,
            initialDate: ref.watch(dateProvider),
            onDateSelected: (date) {
              ref.read(dateProvider.notifier).setDate(date);
            },
          ),
          SizedBox(height: gap_m),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: TColor.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 30),
                  itemCount: mealTypes.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return TodayNutritionInfo(
                        totalCalories: totalCalories,
                        totalCarbo: totalCarbo,
                        totalProtein: totalProtein,
                        totalFat: totalFat,
                        targetCalories: targetCalories,
                        targetCarbo: targetCarbo,
                        targetProtein: targetProtein,
                        targetFat: targetFat,
                      );
                    } else {
                      final mealType = mealTypes[index - 1];
                      final meals = mealsForSelectedDate.where((meal) => meal.mealType == mealType).toList();
                      return foodCard(
                        context,
                        mealType,
                        meals,
                        meals.isNotEmpty && meals[0].imagePath.isNotEmpty ? meals[0].imagePath : 'assets/images/1.png',
                        meals.isNotEmpty ? meals[0].date : DateTime.now(),
                        ref,
                        Colors.deepOrange[200]!,
                        Colors.cyanAccent,
                        Colors.greenAccent,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
