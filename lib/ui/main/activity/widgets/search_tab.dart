import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';

class SearchTab extends StatefulWidget {
  final List<String> foods;
  final ScrollController scrollController;

  const SearchTab({Key? key, required this.foods, required this.scrollController}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String selectedFood = "";
  int portion = 1;
  List<String> filteredFoods = [];

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
          if (selectedFood.isNotEmpty)
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
                  Text('선택한 음식: $selectedFood', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('칼로리, 탄수화물, 단백질, 지방 정보'),
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
                filteredFoods = widget.foods.where((food) => food.contains(query)).toList();
              });
            },
          ),
          const SizedBox(height: 16.0),
          ...filteredFoods.map((food) => ListTile(
            title: Text(food),
            onTap: () => setState(() => selectedFood = food),
          )).toList(),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: selectedFood.isNotEmpty ? () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$selectedFood 등록 완료')),
              );
            } : null,
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
