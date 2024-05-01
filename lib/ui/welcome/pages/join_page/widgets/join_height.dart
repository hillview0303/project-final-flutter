import 'package:flutter/material.dart';

// StatefulWidget으로 변환
class JoinHeight extends StatefulWidget {
  const JoinHeight({Key? key}) : super(key: key);

  @override
  _JoinHeightState createState() => _JoinHeightState();
}

// State 클래스 생성
class _JoinHeightState extends State<JoinHeight> {
  // 선택된 키 값을 저장할 변수
  String? selectedHeight;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedHeight,
      decoration: InputDecoration(
        labelText: '키 (cm)',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: List<String>.generate(201, (index) => (50 + index).toString())
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // setState를 호출하여 selectedHeight 상태를 업데이트
        setState(() {
          selectedHeight = newValue;
        });
      },
    );
  }
}
