import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';


class TodayMission extends StatelessWidget {
  final title;
  final title2;
  final subtitle;
  final icons;
  final page;

  TodayMission(
      {this.title = "",
      this.title2 = "",
      required this.subtitle,
      required this.icons,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(gap_s)),
        child: Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${title}",
                          style: h5(),
                        ),
                        TextSpan(
                          text: "${title2}",
                          style: h6(mColor: Colors.grey[600]!),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${subtitle}",
                    style: subtitle2(),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                icons,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
