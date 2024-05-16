import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import '../../../../_core/constants/size.dart';
import '../../../../data/models/activities/meal_detail.dart';
import '../widgets/custom_calendar_Agenda.dart';
import 'food_add_page.dart';

class DietManagementDetailPage extends ConsumerWidget {
  final CalendarAgendaController _controller = CalendarAgendaController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택된 날짜에 따른 식사 필터링
    final mealsForSelectedDate = ref.watch(mealsForSelectedDateProvider);

    // 고정된 식사
    final List<String> mealTypes = ['BREAKFAST', 'LUNCH', 'DINNER', 'SNACK'];

    return Scaffold(
      appBar: AppBar(
          title: Text('식단 관리', style: TextStyle(color: Colors.white)),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: Colors.white)),
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  boxShadow: [
                    BoxShadow(
                        color: TColor.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3)),
                  ]),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 30),
                itemCount: mealTypes.length,
                itemBuilder: (context, index) {
                  final mealType = mealTypes[index];
                  final meal = mealsForSelectedDate.firstWhere(
                        (meal) => meal.mealType == mealType,
                    orElse: () => MealDetail(
                        date: DateTime.now(),
                        mealType: mealType,
                        foodName: '식사를 추가해 주세요',
                        gram: '',
                        imagePath: '',
                        calories: 0.0,
                        targetCalories: 0.0,
                        carbo: 0.0,
                        protein: 0.0,
                        fat: 0.0),
                  );
                  return foodCard(
                      context,
                      meal.mealType,
                      meal.foodName,
                      meal.gram,
                      meal.imagePath,
                      meal.calories,
                      meal.targetCalories,
                      meal.carbo,
                      meal.protein,
                      meal.fat,
                      meal.date,
                      ref);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foodCard(
      BuildContext context,
      String mealType,
      String foodName,
      String gram,
      String imagePath,
      double calories,
      double targetCalories,
      double carbo,
      double protein,
      double fat,
      DateTime date,
      WidgetRef ref,
      ) {
    final bool isMealAdded = foodName != '식사를 추가해 주세요';
    final double totalNutrients = carbo + protein + fat;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      color: TColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 식사 종류 및 추가 버튼
            ListTile(
              leading: Icon(Icons.breakfast_dining, color: kAccentColor2),
              title: Text(mealType),
              trailing: IconButton(
                icon: Icon(Icons.add, color: kAccentColor2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodAddPage()),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(foodName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: kAccentColor2),
                  onPressed: () {
                    ref.read(mealProvider.notifier).deleteMeal(mealType, date);
                  },
                ),
              ],
            ),

            // 데이터가 있는 경우에만 사진 및 영양 비율 표시
            if (isMealAdded)
              Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(gram),
                            Text("$calories / $targetCalories kcal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // 영양 비율 및 진행 바
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.square, color: Colors.deepOrange[200], size: 20),
                        Text(" 탄수화물 ${carbo.toStringAsFixed(1)}g", style: TextStyle(fontSize: 14)),
                        SizedBox(width: 10),
                        Icon(Icons.square, color: Colors.cyanAccent, size: 20),
                        Text(" 단백질 ${protein.toStringAsFixed(1)}g", style: TextStyle(fontSize: 14)),
                        SizedBox(width: 10),
                        Icon(Icons.square, color: Colors.greenAccent, size: 20),
                        Text(" 지방 ${fat.toStringAsFixed(1)}g", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),

                  // 영양 진행 바
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: (carbo * 100 / totalNutrients).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange[200],
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(5)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (protein * 100 / totalNutrients).toInt(),
                          child: Container(
                            color: Colors.cyanAccent,
                          ),
                        ),
                        Expanded(
                          flex: (fat * 100 / totalNutrients).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
