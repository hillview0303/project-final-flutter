import 'package:flutter/material.dart';
import '../../../../../_core/constants/move.dart';

class TodayGoalInsert extends StatelessWidget {
  const TodayGoalInsert({
    Key? key,
  }) : super(key: key);

  //todo: composition_box 를 서로 공유하고 있어 목표 설정이 같이 됨. 확인 필요
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: '목표량',
              hintText: '목표량을 입력하세요',
              hintStyle: TextStyle(color: Colors.black26),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Move.loginPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            child: const Text('입력 완료',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
        ),
      ],
    );
  }
}
