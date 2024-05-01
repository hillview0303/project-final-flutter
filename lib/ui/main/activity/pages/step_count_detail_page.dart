import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StepCountDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 탭의 수
      child: Scaffold(
        appBar: AppBar(
          title: Text('Daily Steps'),
          backgroundColor: kAccentColor2,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Day'),
              Tab(text: 'Week'),
              Tab(text: 'Month'),
            ],
            indicatorColor: Colors.white,
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
            SizedBox(height: 20),
            Expanded(
              flex: 2, // 차트에 더 많은 공간 할당
              child: getBufferProgress(), // SfRadialGauge 추가
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildActivityCard('310 kcal', '칼로리'),
                _buildActivityCard('7500', '총 걸음수'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3, // 차트에 할당된 공간보다 탭바 뷰에 더 많은 공간 할당
              child: TabBarView(
                children: <Widget>[
                  Center(child: Text('Daily Chart')),
                  Center(child: Text('Weekly Chart')),
                  Center(child: Text('Monthly Chart')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(String data, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(data, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget getBufferProgress() {
    return Container(
      height: 250,
      width: 250,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            canScaleToFit: true,
            endAngle: 360,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              color: const Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.bothCurve,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: 50,
                width: 0.2,
                sizeUnit: GaugeSizeUnit.factor,
                color: const Color.fromARGB(120, 0, 169, 181),
                enableAnimation: true,
                animationDuration: 1500,
                animationType: AnimationType.linear,
                cornerStyle: CornerStyle.bothCurve,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
