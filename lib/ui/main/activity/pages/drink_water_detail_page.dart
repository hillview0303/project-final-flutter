import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/ui/main/activity/viewmodel/drink_water_viewmoddel..dart';
import '../widgets/WaterIntakeGraph.dart';

// 상태 관리를 위한 Provider 선언
final waterIntakeProvider = StateProvider<int>((ref) => 0);

class DrinkWaterDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(DrinkWaterProvider.notifier)..notifyInit();


    final int glassSize = 250; // 한 잔의 크기
    final int totalIntake = 2000; // 총 목표 섭취량

    void _addDrink() {
      final currentIntake = ref.read(waterIntakeProvider.state).state;
      if (currentIntake < totalIntake) {
        ref.read(waterIntakeProvider.state).state += glassSize;
      }
    }

    void _removeDrink() {
      final currentIntake = ref.read(waterIntakeProvider.state).state;
      if (currentIntake > 0) {
        ref.read(waterIntakeProvider.state).state -= glassSize;
      }
    }

    Widget _buildProgressIndicator(int currentIntake) {
      return Stack(
        children: <Widget>[
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          FractionallySizedBox(
            widthFactor: currentIntake >= totalIntake ? 1.0 : currentIntake /
                totalIntake,
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
                  Text(
                      '$currentIntake ml', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildCupIcons(int currentIntake) {
      List<Widget> cups = [];
      for (int i = 0; i < totalIntake / glassSize; i++) {
        String cupImagePath = (i * glassSize < currentIntake)
            ? 'assets/images/water2.png'
            : 'assets/images/greywater.png';
        cups.add(
          Image.asset(cupImagePath, width: 40),
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: cups,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('물 마시기' , style: TextStyle(color: TColor.white)),
        backgroundColor: kAccentColor2,
        iconTheme: IconThemeData(color: TColor.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            WaterIntakeGraph(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 26.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer(
                    builder: (context, ref, child) {
                      final currentIntake = ref.watch(waterIntakeProvider.state).state;
                      return Text(
                        '오늘 물을 $currentIntake ml 마셨어요',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    '수분 충전하세요!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Consumer(
                    builder: (context, ref, child) {
                      final currentIntake = ref.watch(waterIntakeProvider.state).state;
                      return _buildProgressIndicator(currentIntake); // 프로그레스바
                    },
                  ),
                  SizedBox(height: 20),
                  Consumer(
                    builder: (context, ref, child) {
                      final currentIntake = ref.watch(waterIntakeProvider.state).state;
                      return _buildCupIcons(currentIntake); // 컵 아이콘 표시
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    '부족        좋아요        거의다왔어요        완벽해요',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
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
                        bottom: 0,
                        child: Text(
                          '250ml',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove, color: kAccentColor2),
                            onPressed: _removeDrink,
                          ),
                          SizedBox(width: 120),
                          IconButton(
                            icon: Icon(Icons.add, color: kAccentColor2),
                            onPressed: _addDrink,
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
      ),
    );
  }
}
