import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/_core/constants/constants.dart';
import '../widgets/dashed_border_painter.dart';
import '../widgets/date_selector.dart';
import '../widgets/food_info_card.dart';
import '../widgets/food_search_modal.dart';
import '../widgets/image_source_dialog.dart';

class FoodAddPage extends StatefulWidget {
  @override
  _FoodAddPageState createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<FoodAddPage> {
  String formattedDate = DateSelector.formatDate(DateTime.now());
  File? _selectedImage;
  String? _selectedMealType = '아침';
  List<String> foods = ["사과", "바나나", "포도", "오렌지", "치킨 샐러드"];
  List<String> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    filteredFoods = foods;
  }

  @override
  Widget build(BuildContext context) {
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
                _buildImagePicker(),
                SizedBox(width: 16.0),
                _buildMealAndDatePicker(),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _showFoodSearchModal,
              style: ElevatedButton.styleFrom(backgroundColor: kAccentColor2),
              child: Text('음식 추가하기'),
            ),
            SizedBox(height: 16.0),
            FoodInfoCard(),
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

  Widget _buildImagePicker() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Center(
          child: _selectedImage == null
              ? IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: _showImageSourceSelection,
          )
              : Image.file(_selectedImage!),
        ),
      ),
    );
  }

  Widget _buildMealAndDatePicker() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              DateSelector.show(
                context,
                kAccentColor2,
                    (date) {
                  setState(() {
                    formattedDate = DateSelector.formatDate(date);
                  });
                },
              );
            },
            child: Row(
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.calendar_today, size: 18.0),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          DropdownButton<String>(
            value: _selectedMealType,
            items: ['아침', '점심', '저녁', '간식'].map((String mealType) {
              return DropdownMenuItem<String>(
                value: mealType,
                child: Text(mealType),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedMealType = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  void _showFoodSearchModal() {
    FoodSearchModal.show(context, foods, kAccentColor2);
  }

  void _showImageSourceSelection() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImageSourceDialog(
          onImageSourceSelected: _pickImage,
          accentColor: kAccentColor2,
        );
      },
    );
  }

  Future<void> _pickImage(bool useCamera) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: useCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }
}
