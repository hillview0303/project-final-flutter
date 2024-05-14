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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController carbsController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController fatController = TextEditingController();
  int portion = 1; // 인분 수

  bool get isFormValid {
    if (nameController.text.isEmpty) return false;
    if (!unknowns['calories']! && caloriesController.text.isEmpty) return false;
    if (!unknowns['carbs']! && carbsController.text.isEmpty) return false;
    if (!unknowns['protein']! && proteinController.text.isEmpty) return false;
    if (!unknowns['fat']! && fatController.text.isEmpty) return false;
    return true;
  }

  void _checkFormValidity() {
    setState(() {});
  }

  Widget _buildNutrientField(String label, String nutrientKey, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            enabled: !(unknowns[nutrientKey] ?? false),
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => _checkFormValidity(),
          ),
        ),
        Checkbox(
          value: unknowns[nutrientKey] ?? false,
          onChanged: (bool? value) {
            setState(() {
              unknowns[nutrientKey] = value ?? false;
              if (value == true) {
                controller.clear();
              }
              _checkFormValidity();
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
          _buildTextField('음식 이름', controller: nameController),
          _buildNutrientField('칼로리 (kcal)', 'calories', caloriesController),
          const SizedBox(height: 10),
          _buildNutrientField('탄수화물 (g)', 'carbs', carbsController),
          const SizedBox(height: 10),
          _buildNutrientField('단백질 (g)', 'protein', proteinController),
          const SizedBox(height: 10),
          _buildNutrientField('지방 (g)', 'fat', fatController),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: isFormValid
                ? () {
              final name = nameController.text;
              final calories = unknowns['calories']! ? 0.0 : double.tryParse(caloriesController.text) ?? 0.0;
              final carbs = unknowns['carbs']! ? 0.0 : double.tryParse(carbsController.text) ?? 0.0;
              final protein = unknowns['protein']! ? 0.0 : double.tryParse(proteinController.text) ?? 0.0;
              final fat = unknowns['fat']! ? 0.0 : double.tryParse(fatController.text) ?? 0.0;

              if (name.isNotEmpty) {
                final food = {
                  'id': DateTime.now().millisecondsSinceEpoch, // 임시 ID 생성
                  'name': name,
                  'calories': calories,
                  'carbs': carbs,
                  'protein': protein,
                  'fat': fat,
                  'gram': 100, // 기본 그램 설정
                  'portion': portion, // 인분 수 추가
                };
                Navigator.pop(context, food);
              } else {
                // 음식 이름이 비어있는 경우 처리
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('음식 이름을 입력해주세요.')),
                );
              }
            }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isFormValid ? widget.accentColor : Colors.grey,
            ),
            child: const Text('등록하기'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {TextEditingController? controller, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(color: Colors.grey),
        ),
        keyboardType: keyboardType,
        onChanged: (value) => _checkFormValidity(),
      ),
    );
  }
}

