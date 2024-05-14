import 'package:flutter/material.dart';

class FoodInfoCard extends StatelessWidget {
  final String foodName;
  final String volume;
  final String calorie;
  final String protein;
  final String fat;

  FoodInfoCard({
    required this.foodName,
    required this.volume,
    required this.calorie,
    required this.protein,
    required this.fat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          Text('용량: $volume'),
          Text('칼로리: $calorie'),
          Text('단백질: $protein'),
          Text('지방: $fat'),
        ],
      ),
    );
  }
}
