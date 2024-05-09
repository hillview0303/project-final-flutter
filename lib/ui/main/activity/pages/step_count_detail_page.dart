import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

import '../../../../_core/constants/constants.dart';
import '../widgets/step_count_body.dart';

class StepCountDetailPage extends StatefulWidget {
  @override
  _StepCountDetailPageState createState() => _StepCountDetailPageState();
}

class _StepCountDetailPageState extends State<StepCountDetailPage> {
  int _currentSteps = 0;
  late StreamSubscription<StepCount> _stepCountStream;

  @override
  void initState() {
    super.initState();
    _initializePedometer();
  }

  void _initializePedometer() {
    _stepCountStream = Pedometer.stepCountStream.listen(
      _onStepCount,
      onError: _onStepCountError,
    );
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _currentSteps = event.steps;
    });
  }

  void _onStepCountError(dynamic error) {
    print("Step Count Error: $error");
  }

  @override
  void dispose() {
    _stepCountStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('걸음 수', style: TextStyle(color: Colors.white)),
          backgroundColor: kAccentColor2,
          iconTheme: IconThemeData(color: Colors.white),
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
        body: StepCountBody(currentSteps: _currentSteps),
      ),
    );
  }
}
