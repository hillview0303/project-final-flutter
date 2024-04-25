import 'package:flutter/material.dart';

import '../step_count_detail_page.dart';

class StepCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StepCountDetailPage()),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '걸음 수',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0), // 간격 추가
            ],
          ),
        ),
      ),
    );
  }
}
