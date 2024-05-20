import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

import '../../../../_core/constants/size.dart';
import '../../../../data/dtos/survey/survey_response.dart';

class RadioTile extends StatelessWidget {
  final ChoiceDTO choice;
  final int? groupValue;
  final Function(int?) onChanged;

  RadioTile({
    required this.choice,
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
            color: groupValue == choice.choiceId ? kAccentColor2 : TColor.white,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(gap_m),
        ),
        child: RadioListTile<int>(
          title: Text(choice.choiceTitle),
          value: choice.choiceId,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: kAccentColor2,
        ),
      ),
    );
  }
}
