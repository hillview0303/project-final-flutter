import 'package:flutter/material.dart';

class JoinGender extends StatefulWidget {
  const JoinGender({Key? key}) : super(key: key);

  @override
  _JoinGenderState createState() => _JoinGenderState();
}

class _JoinGenderState extends State<JoinGender> {
  String? selectedGender; // 선택된 성별을 저장할 변수

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      decoration: InputDecoration(
        labelText: '성별',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: <String>['남', '여']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedGender = newValue;
        });
      },
    );
  }
}
