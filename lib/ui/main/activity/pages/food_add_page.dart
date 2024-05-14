import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/utils/image_parse_util.dart';
import 'package:project_app/ui/main/activity/viewmodel/food_add_viewmodel.dart';

import '../../../../data/dtos/activity/activity_response.dart';
import '../widgets/dashed_border_painter.dart';
import '../widgets/date_selector.dart';
import '../widgets/food_info_card.dart';
import '../widgets/food_search_modal.dart';
import '../widgets/image_source_dialog.dart';
import '../widgets/manual_entry_tab.dart';
import '../widgets/search_tab.dart';

class FoodAddPage extends ConsumerWidget {
  String formattedDate = DateSelector.formatDate(DateTime.now());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodAddModel = ref.watch(foodAddProvider);
    final foodAddViewModel = ref.read(foodAddProvider.notifier);

    if (foodAddModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('음식 추가하기')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImagePicker(context, foodAddModel, foodAddViewModel),
                  SizedBox(width: 16.0),
                  _buildMealAndDatePicker(context, foodAddViewModel, foodAddModel),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final result = await FoodSearchModal.show(
                      context, foodAddModel.foodContentList, kAccentColor2);
                  if (result != null) {
                    if (result.containsKey('food')) {
                      // 검색 탭에서 반환된 결과 처리
                      final selectedFood = result['food'] as FoodContentListDTO;
                      final portion = result['portion'] as int;
                      foodAddViewModel.selectFood(selectedFood, portion);
                    } else {
                      // 수동 입력 탭에서 반환된 결과 처리
                      final manualFood = FoodContentListDTO(
                        id: result['id'] as int,
                        name: result['name'] as String,
                        kcal: result['calories'] as double,
                        carbo: result['carbs'] as double,
                        protein: result['protein'] as double,
                        fat: result['fat'] as double,
                        gram: result['gram'] as int,
                      );
                      final portion = result['portion'] as int; // 인분 수 처리
                      foodAddViewModel.selectFood(manualFood, portion);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: kAccentColor2),
                child: Text('음식 추가하기'),
              ),
              SizedBox(height: 16.0),
              // 선택한 음식 정보를 보여주는 부분
              if (foodAddModel.selectedFoods.isNotEmpty)
                FoodInfoCard(
                  foods: foodAddModel.selectedFoods,
                  servings: foodAddModel.selectedServings, // 인분 수 전달
                  onRemove: (index) => foodAddViewModel.removeFood(index), // 삭제 콜백 함수 전달
                ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('등록되었습니다!'))),
            style: ElevatedButton.styleFrom(backgroundColor: kAccentColor2),
            child: Text('등록하기'),
          ),
        ),
      );
    }
  }

  Widget _buildImagePicker(BuildContext context, FoodAddModel model, FoodAddViewModel viewModel) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Center(
          child: model.selectedImg == null
              ? IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () => _showImageSourceSelection(context, viewModel),
          )
              : Image.memory(base64Decode(model.selectedImg!)),
        ),
      ),
    );
  }

  Widget _buildMealAndDatePicker(BuildContext context, FoodAddViewModel viewModel, FoodAddModel model) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => DateSelector.show(
              context,
              kAccentColor2,
                  (date) => viewModel.selectDate(DateSelector.formatDate(date)),
            ),
            child: Row(
              children: [
                Text(
                  model.selectedDate == null ? formattedDate : model.selectedDate!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.calendar_today, size: 18.0),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          DropdownButton<String>(
            value: model.selectedMealType,
            items: ['아침', '점심', '저녁', '간식'].map((String mealType) {
              return DropdownMenuItem<String>(
                value: mealType,
                child: Text(mealType),
              );
            }).toList(),
            onChanged: (String? newValue) {
              viewModel.selectMealType(newValue!);
            },
          ),
        ],
      ),
    );
  }

  void _showImageSourceSelection(BuildContext context, FoodAddViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImageSourceDialog(
          onImageSourceSelected: (useCamera) {
            _pickImage(useCamera, viewModel);
          },
          accentColor: kAccentColor2,
        );
      },
    );
  }

  Future<void> _pickImage(bool useCamera, FoodAddViewModel viewModel) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: useCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      viewModel.selectImg(await encodeXFileToBase64(image));
    }
  }
}
