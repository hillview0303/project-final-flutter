import 'package:flutter/material.dart';
import 'package:project_app/ui/main/my/pages/survey_page.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';

class SurveyCompletionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설문 완료'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/survey2.png'),
            SizedBox(height: gap_m),
            Text('설문에 응해주셔서 감사합니다!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: gap_m),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurveyPage()),
                );
              },
              child: Text('돌아가기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
