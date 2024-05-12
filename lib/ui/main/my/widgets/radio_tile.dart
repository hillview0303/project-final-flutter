import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

import '../../../../_core/constants/size.dart';

class RadioTile extends StatelessWidget {
  final String title;
  final String? groupValue;
  final Function(String?) onChanged;

  RadioTile({
    required this.title,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_m),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: groupValue == title ? kAccentColor2 : TColor.white,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(gap_m),
        ),
        child: RadioListTile<String>(
          title: Text(title),
          value: title,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: kAccentColor2,
        ),
      ),
    );
  }
}
