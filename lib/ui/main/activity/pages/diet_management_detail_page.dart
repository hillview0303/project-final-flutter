import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import '../../../../_core/constants/size.dart';
import '../widgets/custom_calendar_Agenda.dart';
import 'food_add_page.dart';

class DietManagementDetailPage extends StatelessWidget {
  final CalendarAgendaController _controller = CalendarAgendaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식단 관리', style: TextStyle(color: Colors.white)),
        backgroundColor: kAccentColor2,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: kAccentColor2,
      body: Column(
        children: <Widget>[
          CustomCalendarAgenda(
            controller: _controller,
            initialDate: DateTime.now(),
            onDateSelected: (date) {
              // 날짜 선택 시 실행할 로직을 추가
            },
          ),
          SizedBox(height: gap_m),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: TColor.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.only(top: 30),
                children: <Widget>[
                  foodCard(
                      context,
                      'BREAKFAST',
                      '고기와 야채',
                      '200g 1인분',
                      'assets/images/meal1.png',
                      0.4,
                      0.3,
                      0.3),
                  foodCard(
                      context,
                      'LUNCH',
                      '버거',
                      '500g 1인분',
                      'assets/images/meal2.png',
                      0.4,
                      0.3,
                      0.3),
                  foodCard(
                      context,
                      'DINNER',
                      '콘스프',
                      '300g 1인분',
                      'assets/images/meal3.png',
                      0.4,
                      0.3,
                      0.3),
                  foodCard(
                      context,
                      'SNACK',
                      '비빔밥',
                      '350g 1인분',
                      'assets/images/meal4.png',
                      0.4,
                      0.3,
                      0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foodCard(BuildContext context, String mealType, String title, String calories, String imagePath, double carbs, double protein, double fats) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      color: TColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 식사 종류 및 추가 버튼
            ListTile(
              leading: Icon(Icons.breakfast_dining, color: kAccentColor2),
              title: Text(mealType),
              trailing: IconButton(
                icon: Icon(Icons.add, color: kAccentColor2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodAddPage()),
                  );
                },
              ),
            ),

            Divider(),

            // 제목 및 삭제 아이콘
            Row(
              children: [
                Expanded(
                  child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: kAccentColor2),
                  onPressed: () {
                    // 삭제 로직을 추가합니다.
                  },
                ),
              ],
            ),

            // 사진
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(calories),
                      Text("1074 / 1960 kcal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),

            // 영양 비율 및 진행 바
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.blue, size: 20),
                  Text(" 탄수화물 75%", style: TextStyle(fontSize: 14)),
                  SizedBox(width: 10),
                  Icon(Icons.square, color: Colors.red, size: 20),
                  Text(" 단백질 12%", style: TextStyle(fontSize: 14)),
                  SizedBox(width: 10),
                  Icon(Icons.square, color: Colors.green, size: 20),
                  Text(" 지방 13%", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),

            // 영양 진행 바
            Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: (carbs * 100).toInt(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(5)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: (protein * 100).toInt(),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: (fats * 100).toInt(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}