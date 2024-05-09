import 'package:flutter/material.dart';

class SurveyFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문조사폼'),
      ),
      body: Center(
        child: const Text('여기에 설문조사 폼을 구성하세요.'),
      ),
    );
  }
}
