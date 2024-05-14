import 'package:flutter/material.dart';
import 'package:project_app/data/dtos/activity/activity_response.dart';

import '../../../../_core/constants/constants.dart';

class SearchTab extends StatefulWidget {
  final List<FoodContentListDTO> foods;
  final ScrollController scrollController;

  const SearchTab({
    Key? key,
    required this.foods,
    required this.scrollController,
  }) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FoodContentListDTO? selectedFood;
  int portion = 1;
  List<FoodContentListDTO> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    filteredFoods = widget.foods;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          if (selectedFood != null)
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('선택한 음식: ${selectedFood!.name}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('칼로리: ${(selectedFood!.kcal * portion).toStringAsFixed(2)} kcal'),
                  Text('탄수화물: ${(selectedFood!.carbo * portion).toStringAsFixed(2)} g'),
                  Text('단백질: ${(selectedFood!.protein * portion).toStringAsFixed(2)} g'),
                  Text('지방: ${(selectedFood!.fat * portion).toStringAsFixed(2)} g'),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  if (portion > 1) setState(() => portion--);
                },
                icon: const Icon(Icons.remove),
              ),
              Text('$portion 인분'),
              IconButton(
                onPressed: () => setState(() => portion++),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextField(
            decoration: const InputDecoration(
              labelText: '검색어 입력',
              border: OutlineInputBorder(),
            ),
            onChanged: (String query) {
              setState(() {
                filteredFoods = widget.foods
                    .where((food) => food.name.contains(query))
                    .toList();
              });
            },
          ),
          const SizedBox(height: 16.0),
          ...filteredFoods
              .map((food) => ListTile(
            title: Text(food.name),
            onTap: () => setState(() => selectedFood = food),
          ))
              .toList(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: selectedFood != null
                ? () {
              // 선택한 음식과 인분 정보를 반환
              Navigator.pop(context, {'food': selectedFood, 'portion': portion});
            }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor2,
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('등록하기'),
          ),
        ],
      ),
    );
  }
}
