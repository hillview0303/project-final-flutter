import 'package:flutter/material.dart';

class DrinkWater extends StatefulWidget {
  @override
  _DrinkWaterState createState() => _DrinkWaterState();
}

class _DrinkWaterState extends State<DrinkWater> {
  double _currentWaterIntake = 0.0;
  final double _dailyGoal = 2000.0; // ml

  void _incrementWaterIntake() {
    setState(() {
      _currentWaterIntake += 250; // Increase by 250ml
      if (_currentWaterIntake > _dailyGoal) _currentWaterIntake = _dailyGoal;
    });
  }

  void _decrementWaterIntake() {
    setState(() {
      _currentWaterIntake -= 250; // Decrease by 250ml
      if (_currentWaterIntake < 0) _currentWaterIntake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _decrementWaterIntake,
                child: Icon(Icons.remove),
                mini: true,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CircularProgressIndicator(
                  value: _currentWaterIntake / _dailyGoal,
                  strokeWidth: 10,
                ),
                width: 120,
                height: 120,
              ),
              FloatingActionButton(
                onPressed: _incrementWaterIntake,
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          ),
        ),
        Text(
          '${_currentWaterIntake.toInt()} ml',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}