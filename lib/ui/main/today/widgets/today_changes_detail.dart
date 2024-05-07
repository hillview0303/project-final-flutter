import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/style.dart';
import '../pages/my_changes_page.dart';
import '../viewmodel/today_page_viewmodel.dart';
import 'input_modal.dart';

class TodayChangesDetail extends StatelessWidget {
  WidgetRef ref;
  TodayPageModel? model;

  TodayChangesDetail(this.ref,this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("체성분", style: subtitle1()),
        Spacer(),
        InkWell(
          onTap: () => showInputModal(context,ref,model),
          child: Text(
            "직접 입력",
            style: subtitle2(),
          ),
        ),
      ],
    );
  }
}