import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../_core/constants/constants.dart';
import '../widgets/dashed_border_painter.dart';
import '../widgets/date_selector.dart';
import '../widgets/image_source_dialog.dart';

class FoodAddPage extends StatefulWidget {
  @override
  _FoodAddPageState createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<FoodAddPage> {
  String formattedDate = DateSelector.formatDate(DateTime.now());
  File? _selectedImage;
  String? _selectedMealType = '아침'; // 기본 선택값으로 '아침' 설정
  List<String> foods = ["사과", "바나나", "포도", "오렌지", "치킨 샐러드"];
  List<String> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    filteredFoods = foods; // 초기 목록 표시
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
                Container(
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
                ),
                SizedBox(width: 16.0),
                Expanded(
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Icon(Icons.calendar_today, size: 18.0), // 달력 아이콘 추가
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      DropdownButton<String>(
                        value: _selectedMealType, // 기본 선택값 설정
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
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _showFoodSearchModal, // 모달 창을 열도록 변경
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor2, // 버튼 색상을 kAccentColor2로 지정
              ),
              child: Text('음식 추가하기'),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '선택한 음식',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('음식 이름: ...'),
                  Text('칼로리: ...'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// 음식 검색 모달 창 표시
  void _showFoodSearchModal() {
    int portion = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      labelColor: kAccentColor2,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: kAccentColor2,
                      tabs: [
                        Tab(text: '검색하기'),
                        Tab(text: '직접 입력하기'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // 검색하기 탭
                          ListView(
                            controller: scrollController, // DraggableScrollableSheet와 연동된 스크롤
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (portion > 1) {
                                        setState(() {
                                          portion--;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text('$portion 인분'),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        portion++;
                                      });
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: '검색어 입력',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (String query) {
                                  setState(() {
                                    filteredFoods = foods.where((food) => food.contains(query)).toList();
                                  });
                                },
                              ),
                              SizedBox(height: 16.0),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(), // 내부의 스크롤 제한
                                itemCount: filteredFoods.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String food = filteredFoods[index];
                                  return ListTile(
                                    title: Text(food),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      // 음식 선택 로직 구현
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          // 직접 입력하기 탭
                          ListView(
                            controller: scrollController, // DraggableScrollableSheet와 연동된 스크롤
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: '음식 이름',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: '칼로리 (kcal)',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 16.0),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: '탄수화물 (g)',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 16.0),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: '단백질 (g)',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 16.0),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: '지방 (g)',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 16.0),
                              ElevatedButton(
                                onPressed: () {
                                  // 입력된 내용을 처리하는 로직 추가
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kAccentColor2,
                                ),
                                child: Text('등록하기'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }



  // 다이얼로그를 사용하여 이미지 소스를 선택
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

  // 이미지를 가져오는 함수
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
