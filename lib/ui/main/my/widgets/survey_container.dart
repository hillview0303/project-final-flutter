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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SurveyFormPage(surveyId)),
        );
      },
      child: Container(
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
                  'assets/images/survey3.png',
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: gap_s),
          ],
        ),
      ),
    );
  }
}
