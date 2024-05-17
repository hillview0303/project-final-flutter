import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TodayNutritionInfo extends StatelessWidget {
  final double totalCarbo;
  final double totalProtein;
  final double totalFat;
  final double targetCarbo;
  final double targetProtein;
  final double targetFat;
  final double totalCalories;
  final double targetCalories;

  const TodayNutritionInfo({
    Key? key,
    required this.totalCarbo,
    required this.totalProtein,
    required this.totalFat,
    required this.targetCarbo,
    required this.targetProtein,
    required this.targetFat,
    required this.totalCalories,
    required this.targetCalories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '오늘의 영양',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            minimum: 0,
                            maximum: 100,
                            startAngle: 270,
                            endAngle: 270,
                            radiusFactor: 0.9,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.15,
                              color: const Color.fromARGB(30, 0, 169, 181),
                              thicknessUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: totalCarbo / targetCarbo * 100,
                                width: 0.15,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Colors.deepOrange[200]!,
                                enableAnimation: true,
                                animationDuration: 1500,
                                animationType: AnimationType.linear,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                            ],
                          ),
                          RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            minimum: 0,
                            maximum: 100,
                            startAngle: 270,
                            endAngle: 270,
                            radiusFactor: 0.75,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.2,
                              color: const Color.fromARGB(30, 0, 169, 181),
                              thicknessUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: totalProtein / targetProtein * 100,
                                width: 0.2,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Colors.cyanAccent,
                                enableAnimation: true,
                                animationDuration: 1500,
                                animationType: AnimationType.linear,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                            ],
                          ),
                          RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            minimum: 0,
                            maximum: 100,
                            startAngle: 270,
                            endAngle: 270,
                            radiusFactor: 0.58,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.27,
                              color: const Color.fromARGB(30, 0, 169, 181),
                              thicknessUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: totalFat / targetFat * 100,
                                width: 0.27,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Colors.greenAccent,
                                enableAnimation: true,
                                animationDuration: 1500,
                                animationType: AnimationType.linear,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${totalCalories.toStringAsFixed(0)}' ,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '/${targetCalories.toStringAsFixed(0)} kcal',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNutrientInfo('탄수화물', totalCarbo, targetCarbo, 'g'),
                  SizedBox(height: 5),
                  _buildNutrientInfo('단백질', totalProtein, targetProtein, 'g'),
                  SizedBox(height: 5),
                  _buildNutrientInfo('지방', totalFat, targetFat, 'g'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientInfo(String nutrient, double amount, double target, String unit) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: nutrient == '탄수화물'
              ? Colors.deepOrange[200]
              : nutrient == '단백질'
              ? Colors.cyanAccent
              : Colors.greenAccent,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nutrient, style: TextStyle(fontSize: 10)),
            Text('${amount.toStringAsFixed(1)} / ${target.toStringAsFixed(1)} $unit', style: TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }
}
