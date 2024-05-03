import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/style.dart';
import '../pages/my_changes_page.dart';

class TodayChangesDetail extends StatelessWidget {
  const TodayChangesDetail({
    super.key,
  });

  void _showInputModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kAccentColor2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kAccentColor2, width: 2.0),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            textTheme: TextTheme(
              subtitle1: TextStyle(color: kAccentColor2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '체지방 (%)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '골격근 (%)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '체중 (kg)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor2, // Button background color
                    foregroundColor: Colors.white, // Button text color
                  ),
                  child: Text('저장'),
                  onPressed: () {
                    Navigator.pop(context); // Close the modal after entry
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("나의 변화", style: subtitle1()),
        Spacer(),
        InkWell(
          onTap: () => _showInputModal(context),
          child: Text(
            "직접 입력",
            style: subtitle2(),
          ),
        ),
      ],
    );
  }
}