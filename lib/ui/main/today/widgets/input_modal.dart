import 'package:flutter/material.dart';
import '../../../../_core/constants/constants.dart';

void showInputModal(BuildContext context) {
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
            titleMedium: TextStyle(color: kAccentColor2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
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
                  backgroundColor: kAccentColor2,
                  foregroundColor: Colors.white,
                ),
                child: Text('저장'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
