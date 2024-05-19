import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';
import 'package:project_app/ui/main/activity/viewmodel/diet_management_detail_viewmodel.dart';
import 'package:project_app/ui/main/activity/viewmodel/food_add_viewmodel.dart';

import '../pages/food_add_page.dart';

Widget foodCard(
  int? mealId,
  BuildContext context,
  String mealType,
  List<FoodsDTO> meals,
  String imagePath,
  DateTime date,
  WidgetRef ref,
  Color carboColor,
  Color proteinColor,
  Color fatColor,
) {
  final bool isMealAdded = meals.isNotEmpty;
  final double totalCalories = meals.fold(0, (sum, meal) => sum + meal.kcal!);
  final double totalCarbo = meals.fold(0, (sum, meal) => sum + meal.carbo!);
  final double totalProtein = meals.fold(0, (sum, meal) => sum + meal.protein!);
  final double totalFat = meals.fold(0, (sum, meal) => sum + meal.fat!);
  final double totalNutrients = totalCarbo + totalProtein + totalFat;

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
                ref.read(foodAddProvider.notifier).selectDate(date);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodAddPage(selectedMealType: mealType),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: Text(
                  isMealAdded ? '총 영양소' : '식사를 추가해 주세요',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              if (isMealAdded)
                IconButton(
                  icon: Icon(Icons.delete, color: kAccentColor2),
                  onPressed: () {
                    ref
                        .read(dietManagementDetailProvider.notifier)
                        .deleteMeal(mealId!);
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
                      child: imagePath.isEmpty
                          ? Container(
                              color: Colors.grey[300],
                              width: 60,
                              height: 60,
                              child: Center(
                                  child: Icon(Icons.add, color: Colors.grey)),
                            )
                          : Image.asset(imagePath,
                              width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "칼로리: ${totalCalories} kcal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                              "탄수화물: ${totalCarbo.toStringAsFixed(1)}g, 단백질: ${totalProtein.toStringAsFixed(1)}g, 지방: ${totalFat.toStringAsFixed(1)}g"),
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
                      Icon(Icons.square, color: carboColor, size: 20),
                      Text(" 탄수화물 ${totalCarbo.toStringAsFixed(1)}g",
                          style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      Icon(Icons.square, color: proteinColor, size: 20),
                      Text(" 단백질 ${totalProtein.toStringAsFixed(1)}g",
                          style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      Icon(Icons.square, color: fatColor, size: 20),
                      Text(" 지방 ${totalFat.toStringAsFixed(1)}g",
                          style: TextStyle(fontSize: 12)),
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
                        flex: (totalCarbo * 100 / totalNutrients).toInt(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: carboColor,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(5)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: (totalProtein * 100 / totalNutrients).toInt(),
                        child: Container(
                          color: proteinColor,
                        ),
                      ),
                      Expanded(
                        flex: (totalFat * 100 / totalNutrients).toInt(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: fatColor,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 개별 음식 정보 표시
                ExpansionTile(
                  title: Text(
                    '개별 음식 정보',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  children: meals.map((meal) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(meal.foodName!,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("${meal.gram}, ${meal.kcal} kcal"),
                        Text(
                            "탄수화물: ${meal.carbo}g, 단백질: ${meal.protein}g, 지방: ${meal.fat}g"),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
        ],
      ),
    ),
  );
}
