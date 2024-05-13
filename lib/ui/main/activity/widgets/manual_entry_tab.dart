import 'package:flutter/material.dart';
import '../../../../_core/constants/constants.dart';

class ManualEntryTab extends StatefulWidget {
  final Color accentColor;
  final ScrollController scrollController;

  const ManualEntryTab({
    Key? key,
    required this.accentColor,
    required this.scrollController,
  }) : super(key: key);

  @override
  _ManualEntryTabState createState() => _ManualEntryTabState();
}

class _ManualEntryTabState extends State<ManualEntryTab> {
  Map<String, bool> unknowns = {
    'calories': false,
    'carbs': false,
    'protein': false,
    'fat': false,
  };

  Widget _buildNutrientField(String label, String nutrientKey, TextInputType keyboardType) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: !(unknowns[nutrientKey] ?? false),
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: keyboardType,
          ),
        ),
        Checkbox(
          value: unknowns[nutrientKey] ?? false,
          onChanged: (bool? value) {
            setState(() {
              unknowns[nutrientKey] = value ?? false;
            });
          },
          activeColor: kAccentColor2,
        ),
        const Text('잘 모름'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          _buildTextField('음식 이름'),
          _buildNutrientField('칼로리 (kcal)', 'calories', TextInputType.number),
          const SizedBox(height: 10),
          _buildNutrientField('탄수화물 (g)', 'carbs', TextInputType.number),
          const SizedBox(height: 10),
          _buildNutrientField('단백질 (g)', 'protein', TextInputType.number),
          const SizedBox(height: 10),
          _buildNutrientField('지방 (g)', 'fat', TextInputType.number),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () {
              // 여기에 등록 로직 추가
              Navigator.pop(context, null);
            },
            style: ElevatedButton.styleFrom(backgroundColor: widget.accentColor),
            child: const Text('등록하기'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(color: Colors.grey),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
