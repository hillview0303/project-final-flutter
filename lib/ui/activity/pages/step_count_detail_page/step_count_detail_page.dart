import 'package:flutter/material.dart';

import '../../../_common/components/listbox.dart';
import 'widgets/step_chart.dart';

class StepCountDetailPage extends StatelessWidget {
  const StepCountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("걸음"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  StepChart(), // 차트
                  SizedBox(height: 16), // 차트와 리스트박스 사이의 간격
                  Listbox(), // 리스트박스
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}