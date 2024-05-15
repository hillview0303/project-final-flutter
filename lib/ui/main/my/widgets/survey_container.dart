import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';
import '../pages/survey_form_page.dart';

class SurveyContainer extends StatelessWidget {
  final String title;
  final int questionCount;
  final String isAttend;
  final String progress;
  final int surveyId;

  const SurveyContainer({
    Key? key,
    required this.title,
    required this.questionCount,
    required this.isAttend,
    required this.progress,
    required this.surveyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/surveyicon1.png',
                width: 60.0,
                height: 60.0,
              ),
              const SizedBox(width: gap_s),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: gap_s),
                    Text('총 문항수: $questionCount'),
                    Text('참여 상태: $isAttend'),
                    Text('진행 상태: $progress'),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentColor2,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurveyFormPage(surveyId)),
                  );
                },
                child: const Text(
                  '설문 참여하기',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: gap_s),
        ],
      ),
    );
  }
}
