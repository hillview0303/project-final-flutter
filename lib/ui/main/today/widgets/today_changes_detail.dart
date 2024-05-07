import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/style.dart';
import '../pages/my_changes_page.dart';
import 'input_modal.dart';

class TodayChangesDetail extends StatelessWidget {
  WidgetRef ref;


  TodayChangesDetail(this.ref);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("체성분", style: subtitle1()),
        Spacer(),
        InkWell(
          onTap: () => showInputModal(context,ref),
          child: Text(
            "직접 입력",
            style: subtitle2(),
          ),
        ),
      ],
    );
  }
}