import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';

class FoodInfoCard extends StatelessWidget {
  final List<FoodContentListDTO> foods;
  final List<int> servings; // 각 음식의 인분 수를 나타내는 리스트

  FoodInfoCard({required this.foods, required this.servings});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 너비를 화면 전체로 늘리기
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(foods.length, (index) {
          final food = foods[index];
          final portion = servings[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 4.0),
                Text('용량: ${(food.gram * portion).toStringAsFixed(2)}g'),
                Text('칼로리: ${(food.kcal * portion).toStringAsFixed(2)}kcal'),
                Text('단백질: ${(food.protein * portion).toStringAsFixed(2)}g'),
                Text('지방: ${(food.fat * portion).toStringAsFixed(2)}g'),
                Divider(), // 음식을 구분하기 위한 선
              ],
            ),
          );
        }),
      ),
    );
  }
}
