import 'package:flutter/material.dart';
import '../../../_common/components/custom_scaffold.dart';
import 'widgets/join_content.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  //todo: provider 로 데이터 넘기기.
  DateTime? selectedDate; // 날짜
  String? selectedGender; // 성별
  String? selectedHeight; // 키

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: JoinContent(),
            ),
          ),
        ],
      ),
    );
  }
}





