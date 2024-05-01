import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import '../widgets/activity_card_widget.dart';
import '../widgets/buffer_progress_widget.dart';
import '../widgets/chart_background_widget.dart';

class StepCountDetailPage extends StatefulWidget {
  @override
  _StepCountDetailPageState createState() => _StepCountDetailPageState();
}

class _StepCountDetailPageState extends State<StepCountDetailPage> {
  int currentSteps = 8000;
  int totalMonthlySteps = 240000;
  int averageDailySteps = 8000;
  double averageAchievementRate = 75.0;
  String maxStepDay = "2024-04-15";
  int maxSteps = 15000;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '걸음 수',
            style: TextStyle(color: Colors.white), // 제목 텍스트 색상을 흰색으로 설정
          ),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: Colors.white), // 아이콘 색상을 흰색으로 설정
          bottom: TabBar(
            tabs: [
              Tab(text: 'Day'),
              Tab(text: 'Week'),
              Tab(text: 'Month'),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '목표의 40%를 달성했어요!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: BufferProgressWidget(progress: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ActivityCardWidget(data: '310 kcal', label: '칼로리'),
                ActivityCardWidget(data: '7500', label: '총 걸음수'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: TabBarView(
                children: <Widget>[
                  ChartBackgroundWidget(
                    milestones: [
                      {'step': 5000, 'label': '5000걸음 돌파!'},
                      {'step': 10000, 'label': '10000걸음 돌파!'},
                      {'step': 20000, 'label': '20000걸음 돌파!'}
                    ],
                    currentSteps: currentSteps,
                  ),
                  ChartBackgroundWidget(
                    milestones: [
                      {'step': 35000, 'label': '35000걸음 주간 목표 달성!'},
                      {'step': 50000, 'label': '50000걸음 주간 목표 달성!'}
                    ],
                    currentSteps: currentSteps,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildDataRow("한달 총 걸음수", "$totalMonthlySteps 걸음"),
                        Divider(),
                        _buildDataRow("한달 평균 걸음수", "$averageDailySteps 걸음"),
                        Divider(),
                        _buildDataRow("한달 평균 달성률", "$averageAchievementRate%"),
                        Divider(),
                        _buildDataRow("가장 많이 걸은 날", "$maxStepDay ($maxSteps 걸음)"),
                      ],
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

  Widget _buildDataRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ],
    );
  }
}
