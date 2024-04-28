import 'package:flutter/material.dart';
import 'package:project_app/common/design/size.dart';

import '../design/constants.dart';
import '../design/style.dart';

class CardBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardBox({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      padding: const EdgeInsets.all(gap_sm),
      margin: const EdgeInsets.all(gap_sm),
      decoration: BoxDecoration(
        color: kAccentColor3,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/1.png',
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: body1(mColor: Colors.black), // 스타일 적용
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}