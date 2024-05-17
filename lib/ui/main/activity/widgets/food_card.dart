import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import '../../../../data/models/activities/meal_detail.dart';
import '../pages/food_add_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    Color carboColor,
    Color proteinColor,
    Color fatColor,
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
              if (isMealAdded)
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
                          Text("$calories kcal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                      Text(" 탄수화물 ${carbo.toStringAsFixed(1)}g", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      Icon(Icons.square, color: proteinColor, size: 20),
                      Text(" 단백질 ${protein.toStringAsFixed(1)}g", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      Icon(Icons.square, color: fatColor, size: 20),
                      Text(" 지방 ${fat.toStringAsFixed(1)}g", style: TextStyle(fontSize: 12)),
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
                            color: carboColor,
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(5)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: (protein * 100 / totalNutrients).toInt(),
                        child: Container(
                          color: proteinColor,
                        ),
                      ),
                      Expanded(
                        flex: (fat * 100 / totalNutrients).toInt(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: fatColor,
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
