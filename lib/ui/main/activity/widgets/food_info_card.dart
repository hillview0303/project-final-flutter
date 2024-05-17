import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';

class FoodInfoCard extends StatelessWidget {
  final List<FoodContentListDTO> foods;
  final List<int> servings;
  final void Function(int) onRemove; // 삭제 콜백 함수

  FoodInfoCard({required this.foods, required this.servings, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(gap_m),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: foods.asMap().entries.map((entry) {
          final index = entry.key;
          final food = entry.value;
          final portion = servings[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: gap_xxs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => onRemove(index), // 삭제 콜백 호출
                    ),
                  ],
                ),
                SizedBox(height: gap_xxs),
                Text('용량: ${(food.gram * portion).toStringAsFixed(2)}g'),
                Text('칼로리: ${(food.kcal * portion).toStringAsFixed(2)}kcal'),
                Text('탄수화물: ${(food.carbo * portion).toStringAsFixed(2)}g'),
                Text('단백질: ${(food.protein * portion).toStringAsFixed(2)}g'),
                Text('지방: ${(food.fat * portion).toStringAsFixed(2)}g'),
                SizedBox(height: gap_s),
                if (index < foods.length - 1) Divider(), // 음식 구분선 추가
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
