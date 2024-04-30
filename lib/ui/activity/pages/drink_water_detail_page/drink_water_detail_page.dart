import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';

class DrinkWaterDetailPage extends StatefulWidget {
  @override
  _DrinkWaterDetailPageState createState() => _DrinkWaterDetailPageState();
}

class _DrinkWaterDetailPageState extends State<DrinkWaterDetailPage> {
  int currentIntake = 0; // 현재 섭취량
  final int glassSize = 250; // 한 잔

  void _addDrink() {
    setState(() {
      currentIntake += glassSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('물 마시기'),
        backgroundColor: TColor.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '오늘 물을 $currentIntake ml 마셨어요',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '수분 충전하세요!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: currentIntake >= 2000 ? 1.0 : currentIntake / 2000.0,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.lightBlueAccent, kAccentColor2!],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('0', style: TextStyle(color: Colors.white)),
                              Text('$currentIntake ml', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '부족       좋아요       거의다왔어요       완벽해요',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/water2.png', width: 120),
                    Positioned(
                      bottom: 0, // 그림 아래에 배치
                      child: Text(
                        '250ml',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // 흰색 배경 적용
                            borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove, color: kAccentColor2),
                            onPressed: () {
                              if (currentIntake > 0) {
                                setState(() {
                                  currentIntake -= glassSize;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 120),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // 흰색 배경 적용
                            borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: kAccentColor2),
                            onPressed: _addDrink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
