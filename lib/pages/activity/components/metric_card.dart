import 'package:flutter/material.dart';
import 'package:project_app/common/design/constants.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Color color;
  final VoidCallback onTap; // 탭 이벤트 콜백 추가

  const MetricCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.color,
    required this.onTap, // onTap 파라미터를 요구
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // InkWell을 사용하여 탭 이벤트 처리
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: TColor.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              subtitle,
              style: TextStyle(
                color: TColor.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              trailing,
              style: TextStyle(
                color: TColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
